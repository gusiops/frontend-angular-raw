import { Component } from '@angular/core';
import { bootstrapApplication } from '@angular/platform-browser';
import { CarsComponent } from './app/cars/cars.component';
import { provideHttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  imports: [CarsComponent],
  template: `<app-cars></app-cars> `,
})
export class App {
  name = 'Angular';
}

bootstrapApplication(App, {
  providers: [provideHttpClient()],
});
