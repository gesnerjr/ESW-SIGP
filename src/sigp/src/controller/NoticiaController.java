package sigp.src.controller;

import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;

import sigp.src.annotations.Restricted;
import sigp.src.component.Noticia;
import sigp.src.dao.NoticiaDao;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.interceptor.download.ByteArrayDownload;
import br.com.caelum.vraptor.interceptor.download.Download;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.view.Results;

@Resource
public class NoticiaController implements IHeaderController {
	private static final String HEADER = "noticia";

	private final Result result;
	private final NoticiaDao dao;
	private Validator validator;

	public NoticiaController(Result result, Validator validator, NoticiaDao dao) {
		this.result = result;
		this.validator = validator;
		this.dao = dao;

		// Noticias que serao mostradas em Latest News....
		this.result.include("ultimasNoticias", dao.listNoticias());
	}

	public String getHeader() {
		return NoticiaController.HEADER;
	}

	@Path("/noticia/")
	public void index() {
		result.include("noticias", dao.list());
	}

	@Path("/noticia/procura/{query}")
	public void procura(String query) {
		result.use(Results.json()).from(dao.search(query)).serialize();
	}

	@Restricted
	@Path("/noticia/novo")
	public void novo_form() {
		result.include("noticias", dao.list());
		// result.include("todaslinhasdepesquisa", ldao.list());
		// result.include("todoscontribuintes", cdao.list());
	}

	/**
	 * testar o envio de imagem
	 * 
	 * @Restricted
	 * @Path("/noticia/cria") public void cria(final Noticia noticia) { //
	 *                        List<LinhaPesquisa> linhas = new
	 *                        ArrayList<LinhaPesquisa>(); // if
	 *                        (idsLinhasdePesquisa != null) { // for (Long id :
	 *                        idsLinhasdePesquisa) { //
	 *                        linhas.add(ldao.getLinhaPesquisa(id)); // } // }
	 *                        // grupo.setPesquisas(linhas);
	 * 
	 *                        validator.validate(noticia);
	 *                        validator.onErrorForwardTo(this).novo_form();
	 *                        dao.save(noticia);
	 *                        result.redirectTo(NoticiaController
	 *                        .class).index(); }
	 **/

	@Restricted
	@Path("/noticia/cria")
	public void cria(final Noticia noticia, final UploadedFile imagem) {
		// List<LinhaPesquisa> linhas = new ArrayList<LinhaPesquisa>();
		// if (idsLinhasdePesquisa != null) {
		// for (Long id : idsLinhasdePesquisa) {
		// linhas.add(ldao.getLinhaPesquisa(id));
		// }
		// }
		// grupo.setPesquisas(linhas);
		try {
			if (imagem == null)
				noticia.setImagem(null);
			else {
				noticia.setImagem(IOUtils.toByteArray((InputStream) imagem
						.getFile()));
				imagem.getFile().close();
			}
		} catch (IOException e) {
			noticia.setImagem(null);
			// e.printStackTrace();
		}
		validator.validate(noticia);
		validator.onErrorForwardTo(this).novo_form();
		dao.save(noticia);
		result.redirectTo(NoticiaController.class).index();
	}

	@Path("/noticia/ver/{idNoticia}")
	public void visualiza(Long idNoticia) {
		Noticia noticia = dao.getNoticia(idNoticia);
		if (noticia == null)
			result.redirectTo(NoticiaController.class).index();
		else
			result.include("noticia", noticia);
	}

	@Restricted
	@Path("/noticia/alterar/{idNoticia}")
	public void altera_form(Long idNoticia) {
		Noticia noticia = dao.getNoticia(idNoticia);
		if (noticia == null)
			result.redirectTo(NoticiaController.class).index();
		else
			result.include("noticia", noticia);
		result.include("noticias", dao.list());
		// result.include("todoscontribuintes", cdao.list());
	}

	@Restricted
	@Path("/noticia/altera")
	public void altera(final Noticia noticia, final UploadedFile imagem,
			final Boolean semImagem) {

		if (semImagem != null && semImagem) {
			noticia.setImagem(null);
		} else {
			try {
				if (imagem != null) {
					noticia.setImagem(IOUtils.toByteArray((InputStream) imagem
							.getFile()));
					imagem.getFile().close();
				}
			} catch (IOException e) {
				noticia.setImagem(null);
				// e.printStackTrace();
			}
		}

		validator.validate(noticia);
		validator.onErrorForwardTo(this).altera_form(noticia.getIdNoticia());
		dao.update(noticia);
		result.redirectTo(NoticiaController.class).index();
	}

	@Restricted
	@Path("/noticia/apagar/{idNoticia}")
	public void remove(Long idNoticia) {
		Noticia noticia = dao.getNoticia(idNoticia);
		if (noticia != null)
			dao.delete(noticia);
		result.redirectTo(NoticiaController.class).index();
	}

	@Path("/noticia/{id}/img")
	public Download imagem(Long id) {
		Noticia n = dao.getNoticia(id);
		if (n.getImagem() == null)
			return null;
		return new ByteArrayDownload(n.getImagem(), "image/png",
				"imagemNoticia");
	}

}
