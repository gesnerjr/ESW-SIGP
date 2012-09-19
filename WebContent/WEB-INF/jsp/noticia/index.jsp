<%@ include file="/header.jsp" %> 

    <div id="side-contents" class="hidden">
    </div>
    
    <div id="contents">
        <h2 class="top">Noticias </h2>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


	<c:forEach items="${noticias}" var="noticia">
		<h3>
			<a href="/SIGP/noticia/ver/${noticia.idNoticia}">${noticia.titulo}</a>
		</h3>
		<!-- Mostrar algo mais? -->
		<%-- 
			<c:choose>
				<c:when test="${grupo.responsavel != null}">${grupo.responsavel.nome}</c:when>
				<c:otherwise> - </c:otherwise>
			</c:choose>
			--%>
	</c:forEach>



	<p>
	<a href="novo"><fmt:message key="novo" /></a>
</p>

<hr />
<p><a href="/SIGP/"><fmt:message key="voltar_a_home" /></a></p>
        
    </div> <!-- id=contents -->




<%@ include file="/footer.jsp" %> 
