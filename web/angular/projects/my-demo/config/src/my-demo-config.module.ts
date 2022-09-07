import { ModuleWithProviders, NgModule } from '@angular/core';
import { MY_DEMO_ROUTE_PROVIDERS } from './providers/route.provider';

@NgModule()
export class MyDemoConfigModule {
  static forRoot(): ModuleWithProviders<MyDemoConfigModule> {
    return {
      ngModule: MyDemoConfigModule,
      providers: [MY_DEMO_ROUTE_PROVIDERS],
    };
  }
}
