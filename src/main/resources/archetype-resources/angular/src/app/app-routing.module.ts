import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppComponent } from 'app/app.component';
import { BookListComponent } from 'app/book-list/book-list.component';
import { HomeComponent } from 'app/home/home.component';

const routes: Routes = [
  {
    path: 'books',
    component: BookListComponent
  }, {
    path: '**',
    component: HomeComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
  providers: []
})
export class AppRoutingModule { }
