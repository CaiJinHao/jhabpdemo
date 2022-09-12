const baseUrl = window.origin;
const configEnv = {
  api: 'https://localhost:6903/',
  identityApi: 'https://localhost:6201/',
  clientId: 'MyDemo_App',
};

configEnv.api = 'https://localhost:44362/';
configEnv.identityApi = 'https://localhost:44355/';
configEnv.clientId = 'MyDemo_App';

/**全局变量定义 */
window.Demo_API = configEnv.api;
//@ts-ignore
window.Identity_API = configEnv.identityApi; //'/identity/';
//@ts-ignore
window.LOGIN_PATH = '/user/login'; //原生登录地址
//授权用户信息
//@ts-ignore
window.AuthorizationInfoStorageKey = 'AUTHORIZATIONINFO';

export const environment = {
  oAuthConfig: {
    authority: configEnv.identityApi,
    redirectUri: baseUrl,
    postLogoutRedirectUri: baseUrl,
    clientId: configEnv.clientId,
    responseType: 'code',
    scope: 'offline_access MyDemo',
  },
};
