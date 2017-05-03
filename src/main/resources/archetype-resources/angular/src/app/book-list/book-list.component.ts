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
  newBook: Book;

  constructor(private bookProvider: BookService) {
    this.newBook = new Book();
  }

  ngOnInit(): void {
    this.bookProvider.getAll().subscribe(
      books => this.books = books,
      error => this.errorMessage = <any>error
    );
  }

  addNewBook(): void {
    this.bookProvider.add(this.newBook).subscribe(
      (addedBook: Book) => this.onBookAdded(addedBook),
      error => this.errorMessage = <any>error
    );
  }

  deleteBook(id: number): void {
    this.bookProvider.delete(id).subscribe(
      res => this.removeBookFromList(id),
      error => this.errorMessage = <any>error
    );
  }

  private onBookAdded(addedBook: Book): void {
    this.books.push(addedBook);
    this.newBook.title = null;
  }

  private removeBookFromList(deletedId: number): void {
    const index = this.books.findIndex(book => book.id == deletedId);
    if (index >= 0) {
      this.books.splice(index);
    }
  }
}
