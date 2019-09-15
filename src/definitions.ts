// @ts-ignore
declare module '@capacitor/core' {
  interface PluginRegistry {
    FaceId: FaceIdPlugin;
  }
}

export interface FaceIdPlugin {
  isAvailable(): Promise<{ value: boolean }>;
  auth(options?: { reason?: string }): Promise<void>;
}
