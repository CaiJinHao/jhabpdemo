import { Injectable } from '@angular/core';
import { RestService } from '@abp/ng.core';

@Injectable({
  providedIn: 'root',
})
export class MyDemoService {
  apiName = 'MyDemo';

  constructor(private restService: RestService) {}

  sample() {
    return this.restService.request<void, any>(
      { method: 'GET', url: '/api/MyDemo/sample' },
      { apiName: this.apiName }
    );
  }
}
