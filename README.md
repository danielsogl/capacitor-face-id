# Capacitor Face ID Plugin

[![npm version](https://badge.fury.io/js/capacitor-face-id.svg)](https://badge.fury.io/js/capacitor-face-id)

Allow useres to authenticate with Face ID or Touch ID on iOS devices

![Logo](https://www.intego.com/mac-security-blog/wp-content/uploads/2017/10/Touch-ID-vs-Face-ID.png)

## Instalation

```sh
npm install capacitor-face-id
```

## iOS Notes

iOS requires the following usage description be added and filled out for your app in `Info.plist`:

Name: `Privacy - Face ID Usage Description`
<br>
Key: `NSFaceIDUsageDescription`

## Example

```ts
import { Plugins, PluginResultError } from '@capacitor/core';

const { FaceId } = Plugins;

...
// check if device supports Face ID or Touch ID
FaceId.isAvailable().then(checkResult => {
  if(checkResult.value) {
    FaceId.auth().then(() => {
      console.log('authenticated');
    }).catch((error: PluginResultError) => {
      // handle rejection errors here
      console.error(error.message);
    });
  } else {
    // use fallback authentication here
  }
});

```

## API

| Method                            | Default                                             | Type                          | Description                                |
| --------------------------------- | --------------------------------------------------- | ----------------------------- | ------------------------------------------ |
| isAvailable()                     |                                                     | `Promise<{ value: boolean }>` | Checks if Face ID or Touch ID is available |
| auth(options?: {reason?: string}) | options: {reason: "Access requires authentication"} | `Promise<void>`               | Displays the Face ID or Touch ID screen    |
