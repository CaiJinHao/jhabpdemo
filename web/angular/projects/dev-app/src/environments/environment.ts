import { Environment } from '@abp/ng.core';

const baseUrl = 'http://localhost:4200';

export const environment = {
  production: false,
  application: {
    baseUrl: 'http://localhost:4200/',
    name: 'MyDemo',
    logoUrl: '',
  },
  oAuthConfig: {
    issuer: 'https://localhost:44355',
    redirectUri: baseUrl,
    clientId: 'MyDemo_App',
    responseType: 'code',
    scope: 'offline_access MyDemo role email openid profile',
    requireHttps: true
  },
  apis: {
    default: {
      url: 'https://localhost:44355',
      rootNamespace: 'MyDemo',
    },
    MyDemo: {
      url: 'https://localhost:44362',
      rootNamespace: 'MyDemo',
    },
  },
} as Environment;
