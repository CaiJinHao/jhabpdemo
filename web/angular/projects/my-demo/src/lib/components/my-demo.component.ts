import { Component, OnInit } from '@angular/core';
import { MyDemoService } from '../services/my-demo.service';

@Component({
  selector: 'lib-my-demo',
  template: ` <p>my-demo works!</p> `,
  styles: [],
})
export class MyDemoComponent implements OnInit {
  constructor(private service: MyDemoService) {}

  ngOnInit(): void {
    this.service.sample().subscribe(console.log);
  }
}
