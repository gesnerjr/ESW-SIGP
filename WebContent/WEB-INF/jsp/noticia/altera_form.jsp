<%@ include file="/header.jsp"%>

<!----------- TITLE ---------->
<div id="page-headline">

	<div id="page-headline-inner">
		<div id="page-title">
			<h2>
				<fmt:message key="header.noticias" />
				:
				<fmt:message key="alterar" />
			</h2>
		</div>
		<!-- end page-title -->
	</div>
	<!-- end page-headline-inner -->
	<div class="separator"></div>
</div>
<!-- end page-headline -->

<!----------- CORPO ---------->
<div id="wrapper">

	<div id="content" class="cont-left">

		<form method="post" action='<c:url value="/noticia/altera"/>'
			enctype="multipart/form-data">

			<p>
				<label><fmt:message key="noticia.titulo" /></label><br /> <input
					class="textbox sigp" type="text" name="noticia.titulo"
					value="${noticia.titulo}" />
			</p>
			<p>
				<label><fmt:message key="noticia.noticia" /></label><br /> <input
					class="textbox sigp" type="text" name="noticia.noticia"
					value="${noticia.noticia}" />
			</p>

			<p>
				<label> <fmt:message key="noticia.tipoNoticia" />
				</label> <br />
				<!-- C:if para verificar qual tipo selecionar ao editar -->
				<c:if test="${noticia.tipoNoticia == 'NORMAL'}">
					<input type="radio" value="NORMAL" name="noticia.tipoNoticia"
						checked="checked">
					<fmt:message key="noticia.normal" />
					<input type="radio" value="DESTAQUE" name="noticia.tipoNoticia">
					<fmt:message key="noticia.destaque" />
				</c:if>
				<c:if test="${noticia.tipoNoticia != 'NORMAL'}">
					<input type="radio" value="NORMAL" name="noticia.tipoNoticia">
					<fmt:message key="noticia.normal" />
					<input type="radio" value="DESTAQUE" name="noticia.tipoNoticia"
						checked="checked">
					<fmt:message key="noticia.destaque" />
				</c:if>

			</p>

			<p>
				<label><fmt:message key="noticia.url" /></label><br /> <input
					class="textbox sigp" type="text" name="noticia.url"
					value="${noticia.url}" />
			</p>

			<p>
				<label><fmt:message key="noticia.imagem" /></label><br />
				<c:if test="${noticia.imagem != null}">
					<img src="/SIGP/noticia/${noticia.idNoticia}/img" width="570" />
				</c:if>
			</p>
			<!-- nova imagem -->
			<div class="spacer"></div>
			<p>
				<label><fmt:message key="noticia.novaImagem" /></label><br /> <input
					type="file" name="imagem" />
			</p>
			<p>
				<label><fmt:message key="noticia.tirarImagem" /></label> <input
					type="checkbox" name="semImagem" />
			</p>
			<p>
				<input type="hidden" name="noticia.idNoticia"
					value="${noticia.idNoticia}" /> <input class="sigp-button"
					type="submit" value="Alterar" />
			</p>
		</form>

		<%@ include file="/errors.jsp"%>

	</div>
	<!-- id=contents -->

	<%@ include file="/footer.jsp"%>

	<!-- antiga..... -->