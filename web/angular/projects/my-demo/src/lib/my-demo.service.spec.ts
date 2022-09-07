import { TestBed } from '@angular/core/testing';

import { MyDemoService } from './my-demo.service';

describe('MyDemoService', () => {
  let service: MyDemoService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MyDemoService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
