package sigp.src.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import sigp.src.component.Noticia;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.RequestScoped;

@Component
@RequestScoped
public class NoticiaDao {
	private final Session session;

	public NoticiaDao(Session session) {
		this.session = session;
	}

	public void save(Noticia noticia) {
		Transaction t = session.beginTransaction();
		session.save(noticia);
		t.commit();
	}

	// public Noticia pegaNoticiaPorLogin(String login) {
	// @SuppressWarnings("unchecked")
	// List<Noticia> noticias = this.session.createCriteria(Noticia.class)
	// .add(Restrictions.eq("login", login)).list();
	// if (noticias.size() > 0)
	// return noticias.get(0);
	// return null;
	//
	// }

	public Noticia getNoticia(Long id) {
		return (Noticia) session.get(Noticia.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Noticia> list() {
		return this.session.createCriteria(Noticia.class).list();
	}

	@SuppressWarnings("unchecked")
	public List<Noticia> listNoticias() {
		List<Noticia> ln = this.session.createCriteria(Noticia.class).list();
		if (ln != null && ln.size() < 5)
			return ln;
		else
			return ln.subList(0, 5);
	}

	public void delete(Noticia noticia) {
		Transaction t = session.beginTransaction();
		session.delete(noticia);
		t.commit();
	}

	public void update(Noticia noticia) {
		Transaction t = session.beginTransaction();
		session.merge(noticia);
		t.commit();
	}

	@SuppressWarnings("unchecked")
	public Noticia find(String titulo) {
		List<Noticia> l = this.session.createCriteria(Noticia.class)
				.add(Restrictions.like("titulo", titulo)).list();
		if (l.size() != 1)
			return null;
		return l.get(0);
	}

	@SuppressWarnings("unchecked")
	public List<Noticia> search(String titulo) {
		return this.session.createCriteria(Noticia.class)
				.add(Restrictions.like("titulo", "%" + titulo + "%")).list();
	}

}
