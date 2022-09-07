import { ComponentFixture, TestBed, waitForAsync } from '@angular/core/testing';

import { MyDemoComponent } from './my-demo.component';

describe('MyDemoComponent', () => {
  let component: MyDemoComponent;
  let fixture: ComponentFixture<MyDemoComponent>;

  beforeEach(waitForAsync(() => {
    TestBed.configureTestingModule({
      declarations: [ MyDemoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MyDemoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
