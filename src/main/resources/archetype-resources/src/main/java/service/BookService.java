#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.service;

import java.util.List;
import java.util.logging.Logger;

import javax.ejb.EJB;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import com.google.gson.JsonParseException;

import ${package}.application.BookDao;
import ${package}.entities.Book;
import ${package}.utils.GsonInstance;

@Path("api/books")
public class BookService {

	private static final Logger log = Logger.getLogger(BookService.class.getName());
	
	@EJB
	BookDao bookDao;

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response getBooks() {
		log.info("GET /books");
		List<Book> books = bookDao.getAll();

		String json = GsonInstance.get().toJson(books);
		return Response.status(Status.OK).entity(json).build();
	}

	@GET
	@Path("/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getBook(@PathParam("id") int id) {
		Status status;
		Object entity;
		
		log.info("GET /books/{id}");

		Book book = bookDao.get(id);

		if (book != null) {
			status = Status.OK;
			entity = book;
		} else {
			status = Status.NOT_FOUND;
			entity = "Ce livre n'existe pas";
		}

		String json = GsonInstance.get().toJson(entity);
		return Response.status(status).entity(json).build();
	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response addBook(String jsonBook) {
		Status status;
		Object entity;
		
		log.info("POST /books");

		try {
			Book newBook = GsonInstance.get().fromJson(jsonBook, Book.class);
			newBook = bookDao.add(newBook);
			status = Status.CREATED;
			entity = newBook;

		} catch (JsonParseException jpe) {
			status = Status.BAD_REQUEST;
			entity = "Format de données incorrect. Attendu : JSON";
		}

		String json = GsonInstance.get().toJson(entity);
		return Response.status(status).entity(json).build();
	}

	@PUT
	@Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateBook(@PathParam("id") int id, String jsonBook) {
		Status status;
		Object entity;
		
		log.info("PUT /books/{id}");

		try {
			Book oldBook = bookDao.get(id);

			if (oldBook != null) {
				Book newBook = GsonInstance.get().fromJson(jsonBook, Book.class);
				log.info("New book: " + newBook);
				newBook = bookDao.add(newBook);
				status = Status.OK;
				entity = newBook;
			} else {
				status = Status.NOT_FOUND;
				entity = "Ce livre n'existe pas";
			}

		} catch (JsonParseException jpe) {
			status = Status.BAD_REQUEST;
			entity = "Format de données incorrect. Attendu : JSON";
		}

		String json = GsonInstance.get().toJson(entity);
		return Response.status(status).entity(json).build();
	}

	@DELETE
	@Path("/{id}")
	public Response deleteBook(@PathParam("id") int id) {
		Status status;
		Object entity;
		
		log.info("DELETE /books");

		Book existingBook = bookDao.get(id);
		if (existingBook != null) {
			bookDao.delete(id);
			status = Status.NO_CONTENT;
			entity = null;
		} else {
			status = Status.NOT_FOUND;
			entity = "Ce livre n'existe pas";
		}

		String json = GsonInstance.get().toJson(entity);
		return Response.status(status).entity(json).build();
	}
}
