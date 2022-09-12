import systemConfig from './RoutesConfig/system.config';
import demoConfig from './RoutesConfig/demo.config';

export default [
  // {
  //   path: '/user',
  //   layout: false,
  //   routes: [
  //     {
  //       path: '/user',
  //       routes: [
  //         {
  //           name: 'login',
  //           path: '/user/login',
  //           component: './user/Login',
  //         },
  //       ],
  //     },
  //     {
  //       component: './404',
  //     },
  //   ],
  // },
  // {
  //   path: '/user/personal',
  //   name: 'personal',
  //   component: './Personal',
  //   hideInMenu: true,
  // },
  {
    path: '/user/settings',
    name: 'settings',
    component: './user/settings',
    hideInMenu: true,
  },
  {
    path: '/flow',
    name: 'flow',
    component: './flow',
  },
  {
    path: '/welcome',
    name: 'welcome',
    icon: 'smile',
    component: './Welcome',
  },
  {
    path: '/systemConfig',
    name: 'systemConfig',
    icon: 'table',
    routes: systemConfig,
  },
  {
    path: '/demo',
    name: 'demo',
    icon: 'table',
    routes: demoConfig,
  },
  {
    path: '/',
    redirect: '/welcome',
  },
  {
    component: './404',
  },
];
