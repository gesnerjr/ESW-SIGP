<%@ include file="/header.jsp"%>

<div id="side-contents" class="hidden"></div>

<div id="contents">
	<h2 class="top">Adicionar nova Notícia</h2>


	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>

	<form method="post" action="/SIGP/noticia/cria">
		<table>
			<tr>
				<td><fmt:message key="noticia.noticia" /></td>
				<td><input type="text" name="noticia.noticia" /></td>
			</tr>
			<tr>
				<td><fmt:message key="noticia.tipoNoticia" /></td>
				<td><input type="text" name="noticia.noticia" /> <!-- seleção de ENUM -->
				</td>
			</tr>
			<tr>
				<td><fmt:message key="noticia.url" /></td>
				<td><input type="text" name="noticia.url" /></td>
			</tr>

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
