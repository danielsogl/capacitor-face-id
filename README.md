# Capacitor Face ID Plugin

[![npm version](https://badge.fury.io/js/capacitor-face-id.svg)](https://badge.fury.io/js/capacitor-face-id)
![](https://github.com/danielsogl/capacitor-face-id/workflows/Node%20CI/badge.svg)
![](https://github.com/danielsogl/capacitor-face-id/workflows/iOS/badge.svg)
![](https://github.com/danielsogl/capacitor-face-id/workflows/Node.js%20Package/badge.svg)

Allow users to authenticate with Face ID or Touch ID on iOS devices

![Logo](https://www.intego.com/mac-security-blog/wp-content/uploads/2017/10/Touch-ID-vs-Face-ID.png)

## Installation

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
      // handle rejection errors
      console.error(error.message);
    });
  } else {
    // use custom fallback authentication here
  }
});

```

## API

| Method                            | Default                                             | Type                         | Description                                                         |
| --------------------------------- | --------------------------------------------------- | ---------------------------- | ------------------------------------------------------------------- |
| isAvailable()                     |                                                     | `Promise<{ value: string }>` | Checks if Face ID or Touch ID is available, and returns type if so. |
| auth(options?: {reason?: string}) | options: {reason: "Access requires authentication"} | `Promise<void>`              | Displays the Face ID or Touch ID screen                             |
