import { NgModule, NgModuleFactory, ModuleWithProviders } from '@angular/core';
import { CoreModule, LazyModuleFactory } from '@abp/ng.core';
import { ThemeSharedModule } from '@abp/ng.theme.shared';
import { MyDemoComponent } from './components/my-demo.component';
import { MyDemoRoutingModule } from './my-demo-routing.module';

@NgModule({
  declarations: [MyDemoComponent],
  imports: [CoreModule, ThemeSharedModule, MyDemoRoutingModule],
  exports: [MyDemoComponent],
})
export class MyDemoModule {
  static forChild(): ModuleWithProviders<MyDemoModule> {
    return {
      ngModule: MyDemoModule,
      providers: [],
    };
  }

  static forLazy(): NgModuleFactory<MyDemoModule> {
    return new LazyModuleFactory(MyDemoModule.forChild());
  }
}
