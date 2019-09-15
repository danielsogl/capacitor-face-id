import { WebPlugin } from '@capacitor/core';
import { FaceIdPlugin } from './definitions';

export class FaceIdWeb extends WebPlugin implements FaceIdPlugin {
  constructor() {
    super({
      name: 'FaceId',
      platforms: ['web']
    });
  }

  async isAvailable(): Promise<{ value: boolean }> {
    return Promise.resolve({ value: false });
  }

  async auth(options: { title?: string; reason?: string }): Promise<void> {
    console.log('AUTH', options);
    return Promise.resolve();
  }
}

const FaceId = new FaceIdWeb();

export { FaceId };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(FaceId);
