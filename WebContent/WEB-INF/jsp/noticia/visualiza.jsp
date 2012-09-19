<%@ include file="/header.jsp"%>

<div id="side-contents" class="hidden"></div>

<div id="contents">
	<h2 class="top">${noticia.titulo}</h2>


	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>

	<p>
		<b>Notícia:</b>
		<c:choose>
			<c:when test="${noticia.titulo != null}">${noticia.titulo}</c:when>
			<c:otherwise> - </c:otherwise>
		</c:choose>
	</p>
	<p>
		<b>Notícia:</b>
		<c:choose>
			<c:when test="${noticia.noticia != null}">${noticia.noticia}</c:when>
			<c:otherwise> - </c:otherwise>
		</c:choose>
	</p>
	<p>
		<b>Tipo da Notícia:</b>
		<c:choose>
			<c:when test="${noticia.tipoNoticia != null}">${noticia.tipoNoticia}</c:when>
			<c:otherwise> - </c:otherwise>
		</c:choose>
	</p>

	<p>
		<b>URL da Notícia:</b>
		<c:choose>
			<c:when test="${noticia.url != null}">${noticia.url}</c:when>
			<c:otherwise> - </c:otherwise>
		</c:choose>
	</p>

	<!-- Imagem -->

	<p>
		<a href="/SIGP/noticia/alterar/${noticia.idNoticia}">Alterar</a> <a
			href="/SIGP/noticia/apagar/${noticia.idNoticia}">Apagar</a>
	</p>

	<hr />
	<p>
		<a href="/SIGP/noticia/"><fmt:message key="noticia.voltar" /></a>
	</p>


</div>
<!-- id=contents -->




<%@ include file="/footer.jsp"%>
