<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pagetitle" value="${noticia.titulo}" />
<%@ include file="/header.jsp"%>

<!----------- TITLE ---------->
<div id="page-headline">

	<div id="page-headline-inner">
		<div id="page-title">
			<h2>"${noticia.titulo}"</h2>
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

		<p>
			<b><fmt:message key="noticia.titulo" /></b> <br />
			${noticia.titulo}
		</p>
		<p>
			<b><fmt:message key="noticia.noticia" /></b> <br />
			${noticia.noticia}
		</p>

		<p>
			<b><fmt:message key="noticia.tipoNoticia" /></b> <br />
			${noticia.tipoNoticia.tipoNoticia}
		</p>
		<p>
			<b><fmt:message key="noticia.url" /></b> <br /> ${noticia.url}
		</p>

		<p>
			<label><fmt:message key="noticia.imagem" /></label><br /> 
				<c:if test="${noticia.imagem != null}">
					<img src="/SIGP/noticia/${noticia.idNoticia}/img" width="570" />
				</c:if>
			</p>

	</div>
	<!-- id=contents -->

	<%@ include file="/footer.jsp"%>
