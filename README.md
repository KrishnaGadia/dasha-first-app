# Associated blog on [Medium](https://medium.com/@krishnagadia3/dasha-ai-and-their-voice-communication-platform-6f22ba56363b)

# How to start the demo app

This example shows how to build a flight search bot on top of Dasha, Amadeus.

1. Clone the repo and install the dependencies:

```sh
git clone https://github.com/KrishnaGadia/dasha-first-app
cd dasha-first-app
npm install
```

2. Create or log into your account using the Dasha CLI tool:

```sh
npx dasha account login
```

3. Create a .env file, and add the following two lines for the map API
```
clientId=****************
secret=**********
```
You will get this after registering the app on [Amadeus]https://developers.amadeus.com/get-started/get-started-with-self-service-apis-335

4. To start a text chat, run:

```sh
npm start chat
```

5. To receive a phone call from Dasha, run:

```sh
npm start <your phone number>
```

The phone number should be in the international format without the `+` (e.g. `12223334455`)
