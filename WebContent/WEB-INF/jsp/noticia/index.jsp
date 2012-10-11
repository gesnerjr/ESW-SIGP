<%@ include file="/header.jsp"%>

<!----------- TITLE ---------->
<div id="page-headline">

	<div id="page-headline-inner">
		<div id="page-title">
			<h2>
				<fmt:message key="header.noticias" />
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

		<div id="container">

			<div id="article">
				<div id="aside" class="one-sixth">
					<jsp:include page="/WEB-INF/jsp/noticia/filtros.jsp" />
				</div>
				<div style="display: inline-block; width: 450px">

					<h2>Full List</h2>
					<ol class="custom-list">
						<c:forEach items="${noticias}" var="noticia">
							<li><strong>"<a
									href="<c:url value="/noticia/ver/${noticia.idNoticia}"></c:url>">${noticia.titulo}
										- ${noticia.tipoNoticia.tipoNoticia} <c:if
											test="${noticia.imagem != null}">
											<img src="/SIGP/noticia/${noticia.idNoticia}/img" width="70" />
										</c:if>
								</a>"
							</strong></li>
						</c:forEach>
						<!-- 						<p> -->
						<%-- 							<a href="novo"><fmt:message key="novo" /></a> --%>
						<!-- 						</p> -->
					</ol>

				</div>
				<!-- end inline-block -->
			</div>
			<!-- end Article -->
			<div class="breakLine"></div>
			<div class="sectionLine"></div>
		</div>
		<!-- Container -->

	</div>
	<!-- end content -->


	<%@ include file="/footer.jsp"%>