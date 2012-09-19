<%@ include file="/header.jsp"%>

<div id="side-contents" class="hidden"></div>

<div id="contents">
	<h2 class="top">${noticia.titulo}</h2>


	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<!-- 
<script type="text/javascript">
$(function(){
	$("#responsavelBusca").autocomplete({
		minLength: 1, // Precisa digitar pelo menos 1 letra para o autocompletar começar. 
		source: function( request, response ) {
			$.ajax({
				url: "../procura/" + request.term,
				dataType: "json",
				success: function( data ) {
					// response é uma função que se passar uma lista de structs com campos id e value, 
					// cria o autocompletar. 
					response($.map(data.list, function(item) {
						return { id: item.idGrupo, 
								 value: item.nome };
					}));
				}
			});
		}
	});
});
</script>
-->

	<form method="post" action="/SIGP/noticia/altera">
		<table>
			<tr>
				<td><fmt:message key="noticia.titulo" /></td>
				<td><input type="text" name="noticia.titulo"
					value="${noticia.titulo}"></td>
			</tr>
			<tr>
				<td><fmt:message key="noticia.noticia" /></td>
				<td><input type="text" name="noticia.noticia"
					value="${noticia.noticia}"></td>
			</tr>
			<tr>
				<td><fmt:message key="noticia.tipoNoticia" /></td>
				<td><input type="radio" value="NORMAL"
					name="noticia.tipoNoticia" checked="checked"> <fmt:message
						key="noticia.normal" /> <input type="radio" value="DESTAQUE"
					name="noticia.tipoNoticia"> <fmt:message
						key="noticia.destaque" /></td>
			</tr>
			<!-- 
			<tr>
				<td><fmt:message key="noticia.tipoNoticia" /></td>
				<td><input type="text" name="noticia.tipoNoticia"
					value="${noticia.tipoNoticia}"> </td>
			</tr>
			   sem valor padrao no acima, que substitui esse, pois esse nao selecionava entre opções-->
			<tr>
				<td><fmt:message key="noticia.url" /></td>
				<td><input type="text" name="noticia.url"
					value="${noticia.url}"></td>
			</tr>

			<!-- Imagem -->

			<tr>
				<td colspan="2"><input type="hidden" name="noticia.idNoticia"
					value="${noticia.idNoticia}"> <input type="submit"
					value="Alterar"></td>
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
