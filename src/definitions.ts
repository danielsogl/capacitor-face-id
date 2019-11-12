// @ts-ignore
declare module '@capacitor/core' {
  interface PluginRegistry {
    FaceId: FaceIdPlugin;
  }
}

export interface FaceIdPluginIsAvailableResult {
  value: string;
}

export interface FaceIdPluginAuthOptions {
  /** String to display authentication reason */
  reason?: string;
}

export interface FaceIdPlugin {
  /**
   * check if Face ID or Touch ID is available
   * @returns  {Promise}
   * @resolve {value: string}
   * @rejects PluginResultError
   */
  isAvailable(): Promise<FaceIdPluginIsAvailableResult>;
  /**
   * Displays the authentication screen
   * @returns  {Promise}
   * @resolve void
   * @rejects PluginResultError
   */
  auth(options?: FaceIdPluginAuthOptions): Promise<void>;
}
