import { Injectable } from '@angular/core';
import { Http, Response, Headers } from '@angular/http';
import { Observable } from 'rxjs/Observable';

import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/observable/throw';
import { Book } from 'app/book';

@Injectable()
export class BookService {
  private readonly ENDPOINT = './api/books';
  private headers: Headers = new Headers({ 'ContentType': 'application/json' });

  constructor(private http: Http) { }

  getAll(): Observable<Book[]> {
    return this.http.get(this.ENDPOINT, { headers: this.headers })
      .map(res => res.json() as Book[])
      .catch(this.onError);
  }

  private onError(error: Response | any) {
    const msg = error as string;
    console.error(msg);
    return Observable.throw(msg);
  }
}
