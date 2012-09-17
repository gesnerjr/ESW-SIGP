<%@ include file="/header.jsp"%>

<div id="side-contents" class="hidden"></div>

<div id="contents">
	<h2 class="top">${noticia.url}</h2>
	<!-- Aqui ficaria algo como o nome da noticia, o que por enquanto não tem -->


	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>

	<p>
		<b>Notícia:</b>
		<c:choose>
			<c:when test="${noticia.noticia != null}">${noticia.noticia}</c:when>
			<c:otherwise> - </c:otherwise>
			<!-- não é necessário, mas não tenho certeza do que colocar por enquanto -->
		</c:choose>
	</p>
	<p>
		<b>Tipo da Notícia:</b>
		<c:choose>
			<c:when test="${noticia.tipoNoticia != null}">${noticia.tipoNoticia}</c:when>
			<c:otherwise> - </c:otherwise>
			<!-- não é necessário, mas não tenho certeza do que colocar por enquanto -->
		</c:choose>
	</p>

	<p>
		<b>URL da Notícia:</b>
		<c:choose>
			<c:when test="${noticia.url != null}">${noticia.url}</c:when>
			<c:otherwise> - </c:otherwise>
			<!-- não é necessário, mas não tenho certeza do que colocar por enquanto -->
		</c:choose>
	</p>


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
