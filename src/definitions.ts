declare module "@capacitor/core" {
  interface PluginRegistry {
    FaceId: FaceIdPlugin;
  }
}

export interface FaceIdPlugin {
  echo(options: { value: string }): Promise<{value: string}>;
}
