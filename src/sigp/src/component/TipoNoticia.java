package sigp.src.component;

public enum TipoNoticia {
	PADRAO("Padrao")/* , ADMINISTRADOR("Administrador") */;
	private String tipoNoticia;

	private TipoNoticia(String tipoNoticia) {
		this.tipoNoticia = tipoNoticia;
	}

	public String getTipoNoticia() {
		return tipoNoticia;
	}
}
