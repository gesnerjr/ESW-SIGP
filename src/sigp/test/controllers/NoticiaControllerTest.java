package sigp.test.controllers;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import sigp.src.component.Noticia;
import sigp.src.component.TipoNoticia;
import sigp.src.controller.NoticiaController;
import sigp.src.dao.NoticiaDao;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;

public class NoticiaControllerTest {
	NoticiaController controller;
	Result result;
	NoticiaDao dao;
	Validator validator;
	List<Noticia> list;

	@Before
	public void setUp() throws Exception {
		result = mock(Result.class);
		dao = mock(NoticiaDao.class);
		validator = mock(Validator.class);
		controller = new NoticiaController(result, validator, dao);

		NoticiaController controlmock = mock(NoticiaController.class);
		when(result.redirectTo(NoticiaController.class))
				.thenReturn(controlmock);
		when(validator.onErrorForwardTo(controller)).thenReturn(controlmock);

		setUpDao();
	}

	public void setUpDao() {
		list = new ArrayList<Noticia>();
		{
			Noticia n = new Noticia();
			n.setNoticia("Noticia");
			n.setTipoNoticia(TipoNoticia.NORMAL);
			n.setTitulo("Teste");
			n.setUrl("URL da noticia");
			list.add(n);
		}
		{
			Noticia n = new Noticia();
			n.setIdNoticia(2L);
			n.setNoticia("Noticia 2");
			list.add(n);
		}
		when(dao.list()).thenReturn(list);
		when(dao.find("Noticia")).thenReturn(list.get(0));
		when(dao.getNoticia(1L)).thenReturn(list.get(0));
		when(dao.getNoticia(2L)).thenReturn(list.get(1));
	}

	@After
	public void tearDown() throws Exception {
		controller = null;
		result = null;
		dao = null;
	}

	@Test
	public void testIndex() {
		controller.index();
		verify(result).include("noticias", list);
	}

	@Test
	public void testCria() {
		{
			Noticia n = list.get(0);
			controller.cria(n);
			verify(dao).save(n);
		}
		{
			Noticia n = new Noticia();
			n.setNoticia("Teste Noticia");
			controller.cria(n);
			verify(dao).save(n);
			// assertSame(n.getNoticia(), list.get(0));
		}
	}

	@Test
	public void testVisualiza() {
		Noticia n = list.get(0);
		controller.visualiza(n.getIdNoticia());
		verify(result).include("noticia", n);
	}

	@Test
	public void testAltera() {
		{
			Noticia n = list.get(0);
			controller.altera(n);
			verify(dao).update(n);
		}
		{
			Noticia n = new Noticia();
			n.setNoticia("Teste Noticia");
			controller.altera(n);
			verify(dao).update(n);
			// assertSame(n.getNoticia(),list.get(0));
		}
	}

	@Test
	public void testRemove() {
		Noticia n = list.get(0);
		controller.remove(n.getIdNoticia());
	}

}
