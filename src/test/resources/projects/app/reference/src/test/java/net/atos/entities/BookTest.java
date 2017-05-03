package net.atos.entities;

import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.Matchers.*;

public class BookTest {

	private Book book;
	
	@Before
	public void setup() {
		book = new Book();
		book.setId(42);
		book.setTitle("Effective Java");
	}
	
	@Test
	public void booksAreEquals() {
		Book otherBook = new Book();
		otherBook.setId(42);
		otherBook.setTitle("Effective Java");
		
		assertThat(book, equalTo(book));
		assertThat(book, equalTo(otherBook));
		
		otherBook.setId(43);
		assertThat(book, not(equalTo(otherBook)));
	}
	
	@Test
	public void sameHashcodeIfEquals() {
		Book otherBook = new Book();
		otherBook.setId(42);
		otherBook.setTitle("Effective Java");
		
		assertThat(book.hashCode(), equalTo(otherBook.hashCode()));
	}
}
