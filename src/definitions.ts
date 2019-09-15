declare module '@capacitor/core' {
  interface PluginRegistry {
    FaceId: FaceIdPlugin;
  }
}

export interface FaceIdPlugin {
  isAvailable(): Promise<{ value: boolean }>;
  auth(options: { title?: string; reason?: string }): Promise<void>;
}
