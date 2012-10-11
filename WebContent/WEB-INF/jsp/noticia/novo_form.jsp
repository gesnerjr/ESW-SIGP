<%@ include file="/header.jsp"%>

<!----------- TITLE ---------->
<div id="page-headline">

	<div id="page-headline-inner">
		<div id="page-title">
			<h2>
				<fmt:message key="header.noticias" />
				:
				<fmt:message key="inserir" />
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

		<form method="post" action='<c:url value="/noticia/cria"/>'
			enctype="multipart/form-data">

			<p>
				<label><fmt:message key="noticia.titulo" /></label><br /> <input
					class="textbox sigp" type="text" name="noticia.titulo" />
			</p>
			<p>
				<label><fmt:message key="noticia.noticia" /></label><br /> <input
					class="textbox sigp" type="text" name="noticia.noticia" />
			</p>

			<p>
				<label><fmt:message key="noticia.tipoNoticia" /></label><br /> <input
					type="radio" value="NORMAL" name="noticia.tipoNoticia"
					checked="checked">
				<fmt:message key="noticia.normal" />
				<input type="radio" value="DESTAQUE" name="noticia.tipoNoticia">
				<fmt:message key="noticia.destaque" />
			</p>

			<!-- 		<div class="spacer"></div> -->
			<!--         <h2>Image</h2> -->
			<!-- 		<p> -->
			<%-- 			<label><fmt:message key="publicacao.pdf" /></label><br /> --%>
			<!-- 			<input type="file" name="pdf"/> -->
			<!-- 		</p> -->

			<p>
				<label><fmt:message key="noticia.url" /></label><br /> <input
					class="textbox sigp" type="text" name="noticia.url" />
			</p>

			<!-- imagem -->
			<div class="spacer"></div>
			<h2>Files</h2>
			<p>
				<label><fmt:message key="noticia.imagem" /></label><br /> <input
					type="file" name="imagem" />
			</p>

			<div class="spacer"></div>
			<p>
				<input class="sigp-button" type="submit" value="Criar" />
			</p>
			<div class="spacer"></div>
		</form>

		<%@ include file="/errors.jsp"%>

	</div>
	<!-- id=contents -->




	<%@ include file="/footer.jsp"%>