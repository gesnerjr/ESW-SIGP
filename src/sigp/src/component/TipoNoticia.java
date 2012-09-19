package sigp.src.component;

public enum TipoNoticia {
	NORMAL("Normal"),DESTAQUE("Destaque");
	private String tipoNoticia;

	private TipoNoticia(String tipoNoticia) {
		this.tipoNoticia = tipoNoticia;
	}

	public String getTipoNoticia() {
		return tipoNoticia;
	}
}
