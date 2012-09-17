package sigp.test;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import sigp.src.component.Noticia;
import sigp.src.component.TipoNoticia;

public class NoticiaTest {

	Noticia noticia;

	// File avatar;
	// Contribuinte contribuinte;

	@Before
	public void setUp() throws Exception {
		criarNoticia();
	}

	@After
	public void tearDown() throws Exception {
		noticia = null;
	}

	@Test
	public void deveriaDevolverAUrlDaNoticia() {
		assertEquals("URL da notícia", noticia.getUrl());
	}

	@Test
	public void deveriaDevolverANoticiaDaNoticia() {
		assertEquals("Notícia TESTE", noticia.getNoticia());
	}

	@Test
	public void deveriaDevolverOTipoDaNoticia() {
		assertEquals(TipoNoticia.PADRAO, noticia.getTipoNoticia());
	}

	private void criarNoticia() {
		noticia = new Noticia();

		noticia.setNoticia("Notícia TESTE");
		noticia.setTipoNoticia(TipoNoticia.PADRAO);
		noticia.setUrl("URL da notícia");
		// noticia.setImagem();//Não utilizando por enquanto //TODO implementar
		// parte de imagens na notícia
	}

}
