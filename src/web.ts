import { WebPlugin } from '@capacitor/core';
import { FaceIdPlugin } from './definitions';

export class FaceIdWeb extends WebPlugin implements FaceIdPlugin {
  constructor() {
    super({
      name: 'FaceId',
      platforms: ['web']
    });
  }

  async echo(options: { value: string }): Promise<{value: string}> {
    console.log('ECHO', options);
    return options;
  }
}

const FaceId = new FaceIdWeb();

export { FaceId };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(FaceId);
