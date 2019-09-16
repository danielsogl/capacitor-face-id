// @ts-ignore
declare module '@capacitor/core' {
  interface PluginRegistry {
    FaceId: FaceIdPlugin;
  }
}

export interface FaceIdPluginIsAvailableResult {
  /* true if Face ID or Touch ID is available */
  value: boolean;
}

export interface FaceIdPluginAuthOptions {
  /* String to display authentication reason */
  reason?: string;
}

export interface FaceIdPlugin {
  /**
   * check if Face ID or Touch ID is available
   * @returns true if available
   */
  isAvailable(): Promise<FaceIdPluginIsAvailableResult>;
  /**
   * Displays the authentication screen
   * @returns {Promise<void>}
   * @throws {PluginResultError}
   */
  auth(options?: FaceIdPluginAuthOptions): Promise<void>;
}
