#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.application;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

import ${package}.entities.Book;

@Stateless
public class BookDao {

    @PersistenceContext(unitName = "PU")
    private EntityManager em;

	public List<Book> getAll() {
		CriteriaQuery<Book> cq = em.getCriteriaBuilder().createQuery(Book.class);
		cq.select(cq.from(Book.class));
		return em.createQuery(cq).getResultList();
	}

	public Book get(int id) {
		return em.find(Book.class, id);
	}

	public Book add(Book newBook) {
		em.persist(newBook);
		return newBook;
	}

	public Book update(int id, Book updated) {
		em.merge(updated);
		return updated;
	}

	public void delete(int id) {
		Book toDelete = get(id);
		em.remove(toDelete);
	}
}
