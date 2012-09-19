<%@ include file="/header.jsp"%>

<div id="side-contents" class="hidden"></div>

<div id="contents">
	<h2 class="top">Adicionar nova Notícia</h2>


	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>

	<form method="post" action="/SIGP/noticia/cria">
		<table>
			<tr>
				<td><fmt:message key="noticia.titulo" /></td>
				<td><input type="text" name="noticia.titulo" /></td>
			</tr>
			<tr>
				<td><fmt:message key="noticia.noticia" /></td>
				<td><input type="text" name="noticia.noticia" /></td>
			</tr>
			<tr>
				<td><fmt:message key="noticia.tipoNoticia" /></td>
				<td><input type="radio" value="NORMAL"
					name="noticia.tipoNoticia" checked="checked"> <fmt:message
						key="noticia.normal" /> <input type="radio" value="DESTAQUE"
					name="noticia.tipoNoticia"> <fmt:message
						key="noticia.destaque" /></td>
			</tr>

			<tr>
				<td><fmt:message key="noticia.url" /></td>
				<td><input type="text" name="noticia.url" /></td>
			</tr>
			<!-- imagem -->
			<tr>
				<td colspan="2"><input type="submit" value="Criar" /></td>
			</tr>
		</table>
	</form>

	<%@ include file="/errors.jsp"%>

	<p>
		<a href="/SIGP/noticia/"><fmt:message key="voltar" /></a>
	</p>


</div>
<!-- id=contents -->




<%@ include file="/footer.jsp"%>
