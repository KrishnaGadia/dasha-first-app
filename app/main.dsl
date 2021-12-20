import "commonReactions/all.dsl";

type price =
{
    currency: string;
    total: number;
}
;

type offerResp =
{
    validatingAirlineCodes: string;
    price: price;
}
;

context
{
    input phone: string;
    //input offer: offerResp[] ;
    name: string = "Krishna";
    departure: string = "BOS";
    arrival: string = "NYC";
    date: string = "2022-08-15";
    offers: offerResp[] = [];
    airline: string = "BA";
    total: number = 326;
}

external function getOffers(originLocationCode: string,
destinationLocationCode: string,
departureDate: string,
adults: number=1): offerResp[];

start node root
{
    do
    {
        #connectSafe($phone);
        #waitForSpeech(1000);
        #sayText("Welcome to Fly Me. My name is Nadia. Who's calling?");        
        wait *;
    }
    
    transitions
    {
        provide_data: goto dept on #messageHasData("name");
    }
}
node dept
{
    do
    {
        set $name = #messageGetData("name",
        {
            value:true
        }
        )[0]?.value??"";
        #say("welcome",
        {
            name: $name
        }
        );
        #sayText("Where are you flying from?");       
        wait *;
    }
    
    transitions
    {
        provide_data: goto dest on #messageHasData("location",
        {
            value:true
        }
        );
    }
}

node dest
{
    do
    {
        set $departure = #messageGetData("location",
        {
            value:true
        }
        )[0]?.value??"";
        #sayText("Where are you going to?");
               
        wait *;
    }
    transitions
    {
        provide_data: goto dod on #messageHasData("location",
        {
            value:true
        }
        );
    }
}

node dod
{
    do
    {
        set $arrival = #messageGetData("location",
        {
            value:true
        }
        )[0]?.value??"";
        #sayText(" When do you want to fly out. say yyyy-MM-dd");
        wait *;
    }
    transitions
    {
        provide_data: goto res on true;
    }

}

node res
{
    do
    {
        set $date = #messageGetData("date",
            {
                value:true
            }
            )[0]?.value??"2022-07-18";
        #sayText("Here is the flight I got");
        
        external getOffers($departure,$arrival,$date);
        #say("offer", {airline: $airline, total:$total});

        #disconnect();
        
    }
}

node select
{
    do
    {
        #sayText("Hi, here is your final itinary.");
        #disconnect();
        exit;
    }
}
