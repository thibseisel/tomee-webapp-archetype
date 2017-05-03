import { Component, OnInit, OnDestroy } from '@angular/core';
import { BookService } from 'app/book.service';
import { Book } from 'app/book';

@Component({
  selector: 'app-book-list',
  templateUrl: './book-list.component.html',
  styleUrls: ['./book-list.component.css']
})
export class BookListComponent implements OnInit {
  books: Book[];
  errorMessage: string;

  constructor(private bookProvider: BookService) { }

  ngOnInit(): void {
    this.bookProvider.getAll().subscribe(
      books => this.books = books,
      error => this.errorMessage = <any>error
    );
  }

}
