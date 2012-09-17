package sigp.src.component;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import br.com.caelum.vraptor.Resource;

@Entity
@Resource
@Table(name = "NOTICIA")
public class Noticia {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idNoticia;

	// private File avatar;

	@NotNull(message = "Notícia precisa ter uma descrição.")
	private String noticia;

	@NotNull(message = "Notícia precisa ter um tipo.")
	private TipoNoticia tipoNoticia;

	@NotNull(message = "Notícia precisa ter uma URL.")
	private String url;

	// @NotEmpty(message = "Notícia precisa ter uma imagem.")
	// private Image imagem;

	@NotEmpty(message = "Usuário precisa ter login.")
	private String login;

	@Id
	@GeneratedValue
	@Column(name = "NOTICIA_ID")
	public Long getIdNoticia() {
		return idNoticia;
	}

	public void setIdNoticia(Long idNoticia) {
		this.idNoticia = idNoticia;
	}

	@Column(name = "NOTICIA_NOTICIA", nullable = false, length = 255)
	public String getNoticia() {
		return noticia;
	}

	public void setNoticia(String noticia) {
		this.noticia = noticia;
	}

	@Enumerated(EnumType.STRING)
	@Column(name = "NOTICIA_TIPO", nullable = false, length = 50)
	public TipoNoticia getTipoNoticia() {
		return tipoNoticia;
	}

	public void setTipoNoticia(TipoNoticia tipoNoticia) {
		this.tipoNoticia = tipoNoticia;
	}

	@Column(name = "NOTICIA_URL", nullable = false, length = 255)
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
