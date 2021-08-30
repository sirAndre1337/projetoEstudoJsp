<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Cadastro de usuario</title>
<jsp:include page="head.jsp"></jsp:include>
</head>

<body>

	<!-- Pre-loader start -->
	<jsp:include page="pre-load.jsp"></jsp:include>
	<!-- Pre-loader end -->

	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		 <div class="pcoded-container navbar-wrapper">

			<jsp:include page="barradenavegacaocima.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<jsp:include page="barradenavegacaolado.jsp"></jsp:include>

					<div class="pcoded-content">
						<!-- Page-header start -->

						<jsp:include page="page-header.jsp"></jsp:include>

						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">
									
									<div class="card">
                                        <div class="card-header">
                                             <h5>Cadastro de usuário</h5>
                                        </div>
									  <div class="card-block">
											<h2 class="sub-title">Dados do usuário</h2>
											<form class="form-material needs-validation" action="<%=request.getContextPath()%>/ServletUsuarioController" method="post" id="formUser">
												
												<input type="hidden" name="acao" id="acao" value="">
											
											   <div class="form-group form-default form-static-label">
                                                  <input type="text" name="id" id="id" class="form-control" value="${ModelLogin.id}" readonly="readonly">
                                                  <span class="form-bar"></span>
                                                  <label class="float-label">id :</label>
                                               </div>
											   <div class="form-group form-default">
                                                  <input type="text" name="nome" id="nome" class="form-control" value="${ModelLogin.nome}"  required>
                                                  <span class="form-bar"></span>
                                                  <label class="float-label">Nome completo :</label>
                                               </div>
                                               <div class="form-group form-default">
                                                  <input type="text" name="login" id="login" class="form-control" value="${ModelLogin.login}" required>
                                                  <span class="form-bar"></span>
                                                  <label class="float-label">Nome do usuário :</label>
                                               </div>
                                               <div class="form-group form-default">
                                                  <input type="password" name="senha" id="senha" class="form-control" value="${ModelLogin.senha}" required>
                                                  <span class="form-bar"></span>
                                                  <label class="float-label">Senha :</label>
                                               </div>
                                               <div class="form-group form-default">
                                               	 <input type="text" name="email" id="email" class="form-control" value="${ModelLogin.email}" required>
                                               	 <span class="form-bar"></span>
                                               	 <label class="float-label">Email :</label>
                                               </div>
                                               <div class="form-group form-default">
												    <label for="file" class="form-control-label">Foto :</label>
												        <label for="file" class="custom-file col-md-12">
												            <input type="file" id="file" class="file-control" onchange="uploadFile()" name="file">
												            <img class="col-md-6" alt="Imagem" src="" id="target" width="50" height="50">
												            <span class="custom-file-control"></span>
												        </label>
												</div>
												
											   <input type="hidden" value="" name="foto" id="foto">
                                               <button class="btn waves-effect waves-light hor-grd btn-grd-primary" type="submit" >Salvar</button>
                                               <button class="btn waves-effect waves-light hor-grd btn-grd-info" type="button" onclick="limparForm();" >Novo</button>
                                               <button class="btn waves-effect waves-light hor-grd btn-grd-danger" id="btnExcluir" type="button" data-toggle="modal" data-target="#modalDeletarUsuario">Excluir</button>
                                               <button class="btn waves-effect waves-light hor-grd btn-grd-inverse"  type="button"  data-toggle="modal" data-target="#modalPesquisarUsuario">Pesquisar</button>
                                            </form>
                                             <div class="notifications">
												<span class="text-success" id="msgSucess" style="display:none" >${msg}</span>
												<span class="text-pink" id="msgerro" style="display:none">${msgErro}</span>
												<span class="text-pink" id="msg2" style="display:none">${msg2}</span>
                                             </div>
									  </div>
									</div>
									<div class="card">
                                            <div class="card-header">
                                                <h5>Lista de usuários cadastrados</h5>
                                                <div class="card-header-right">
                                                    <ul class="list-unstyled card-option">
                                                        <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                                        <li><i class="fa fa-window-maximize full-card"></i></li>
                                                        <li><i class="fa fa-minus minimize-card"></i></li>
                                                        <li><i class="fa fa-refresh reload-card"></i></li>
                                                        <li><i class="fa fa-trash close-card"></i></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th><i style="padding-left: 25px; font-size: 25px">id</i></th>
                                                                <th><i style="padding-left: 25px; font-size: 25px">nome</i></th>
                                                                <th><i style="padding-left: 25px; font-size: 25px">Login</i></th>
                                                                <th><i class="ti-email" style="padding-left: 25px; font-size: 25px"></i></th>
                                                                <th><i class="ti-pencil-alt" style="padding-left: 25px; font-size: 25px"></i></th>
                                                                <th><i class="ti-trash" style="padding-left: 25px; font-size: 25px"></i></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                         <c:forEach items='${ModelLogins}' var='mL'>
                                                         	<tr>
                                                         		<td><c:out value="${mL.id}"></c:out></td>
                                                         		<td><c:out value="${mL.nome}"></c:out></td>
                                                         		<td><c:out value="${mL.login}"></c:out></td>
                                                         		<td><c:out value="${mL.email}"></c:out></td>
                                                         		<td><a class="btn waves-effect waves-light hor-grd btn-grd-primary" href="ServletUsuarioController?acao=pesquisar&id=${mL.id}">Editar</a></td>
                                                         		<td><a class="btn waves-effect waves-light hor-grd btn-grd-danger" href="ServletUsuarioController?acao=deletar&id=${mL.id}">Excluir</a></td>
                                                         	</tr>
                                                         
                                                         </c:forEach>
                                                        
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
									
									
									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
										   <!-- incio modal Deleta Usuario -->
     	                                       		<div class="modal fade" id="modalDeletarUsuario" tabindex="-1" role="dialog">
													  <div class="modal-dialog" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title">Excluir usuário.</h5>
													        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
													      </div>
													      <div class="modal-body">
													       	 <p>Deseja excluir os dados do usuario <span id="nomeModal">${ModelLogin.login}</span></p>
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
													        <button type="button" class="btn btn-primary" onclick="criarDelete();">Excluir usuário</button>
													      </div>
													    </div>
													  </div>
													</div>
                                            <!-- fim modal -->
                                            
                                             <!-- incio modal Pesquisar usuarios -->
     	                                       		<div class="modal fade bd-example-modal-lg" id="modalPesquisarUsuario" tabindex="-1" role="dialog">
													  <div class="modal-dialog modal-lg" role="document">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title">Pesquisar usuário.</h5>
													        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
													      </div>
													      <div class="modal-body">
													       		<div class="input-group mb-3">
																	  <input type="text" class="form-control" name="nomeBusca" id="nomeBusca" placeholder="Nome " aria-label="Recipient's username" aria-describedby="basic-addon2" required>
																	  <div class="input-group-append">
																	    <button class="btn waves-effect waves-light hor-grd btn-grd-primary" type="button" onclick="buscarUsuario();" >Buscar</button>
																	  </div>
																</div>
																<div style="height: 300px; overflow: scroll">
																<table class="table" id="tabelaResultado">
																  <thead>
																    <tr>
																      <th scope="col">id</th>
																      <th scope="col">Nome</th>
																      <th scope="col">Login</th>
																      <th scope="col">Editar</th>
																    </tr>
																  </thead>
																  <tbody>
																  </tbody>
																</table>
																</div>
													      <span id="resultado"></span>
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
													      </div>
													    </div>
													  </div>
													</div>
                                            <!-- fim modal -->

	<jsp:include page="javascriptdohtml.jsp"></jsp:include>
	
	<script type="text/javascript">
	
function uploadFile(){
		
		var target = document.querySelector('img'); // pega toda a tag img
		var file = document.querySelector('input[type=file]').files[0]; // pega td a tag input file na posicao 0 (na primeira);
		
		var reader = new FileReader(); 
		
		reader.onloadend = function () {
			
			document.getElementById('foto').value = target.src;
			
			
// 			//upload ajax para o servidor(Nao para a nasa --')
			
// 			$.ajax({
// 				method : 'Post' ,
// 				url : 'ServletFile' ,
// 				data : {FileUpload : target.src }
// 			}).done(function(response) {
// 				alert('Sucesso: ' + response);
// 			}).fail(function(xhr , status , errorThrown){
// 				alert('Erro : ' + xhr.responseText);
// 			})
			
// 			// fim do upload
			
		};
		
		if(file) {
			reader.readAsDataURL(file);
			
		} else {
			target.src = "";
		}
		
	}
	
	
	</script>
	
	<script type="text/javascript">
	
		$(window).on('load',function(){
			
		var msgsuc = document.getElementById("msgSucess").textContent;
		var msg = document.getElementById("msg2").textContent;
		
		
		
		
		if (msgsuc != '' || msg != '') {
			
			function notificar(msg , type) {
				
				  $.growl({
					  	title:  " Mensagem : ",
			            message: msg
			        },{
			            type: type,
			            allow_dismiss: true,
			            label: 'Cancel',
			            className: 'btn-xs btn-inverse',
			            placement: {
			                from: 'top',
			                align: 'right'
			            },
			            delay: 3500,
			            animate: {
			                    enter: 'animated fadeInDown',
			                    exit: 'animated fadeOutUp'
			            },
			            offset: {
			                x: 30,
			                y: 30
			            }
			        });
				
			}
			
			if (msgsuc !='') {
				notificar(msgsuc , 'primary');
			} else {
			notificar(msg , 'danger');
			}
		}
			
		var id = document.getElementById("id").value;
		
		if (id == '') {
			document.getElementById('btnExcluir').disabled = true; 
			document.getElementById('btnExcluir').title = 'Nenhum Usuario Selecionado.'
		} else {
			document.getElementById('btnExcluir').title = 'Excluir'
		}
		
		
		
		})
		
		function verEditar(id) {
			
			var urlAction = document.getElementById("formUser").action;
			
			window.location.href = urlAction + '?acao=pesquisar&id=' +id;
			
		}
	
		
		function buscarUsuario() {
			
			var urlAction = document.getElementById("formUser").action;
			var nomeBusca = document.getElementById("nomeBusca").value;
			
			if (nomeBusca !=null && nomeBusca != '' && nomeBusca.trim() != '') {
				
				$.ajax({
					
					method: "get",
					url : urlAction,
					data : "nomeBusca=" + nomeBusca + "&acao=buscarUserAjax",
					success: function(response){
						
						var json = JSON.parse(response);
						
						$('#tabelaResultado > tbody > tr').remove();
						
						for(var p = 0; p < json.length; p++) {
							$('#tabelaResultado > tbody').append('<tr><td>'+json[p].id+'</td><td>'+json[p].nome+'</td><td>'+json[p].login+'</td><td><button type="button" onclick="verEditar('+json[p].id+')" class="btn btn-info">Editar</button></td></tr>')
						}
						document.getElementById("resultado").textContent = 'Resultados : ' + json.length;
					}
					
				}).fail(function(xhr, status, errorThrown){
					alert('Erro ao pesquisar usuario : ' + xhr.responseText);
				})
				
			}
			
		}
	
	
		function limparForm() {
			
			var elementos = document.getElementById("formUser").elements;
			
			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
				
			}
			
			document.getElementById("nomeModal").textContent = '';
			document.getElementById('btnExcluir').disabled = true; 
			document.getElementById('btnExcluir').title = 'Nenhum Usuario Selecionado.'
			
		}
	
	</script>
	
	<script type="text/javascript">
		function criarDelete() {
			document.getElementById("formUser").method = 'get';
			document.getElementById("acao").value = 'deletar';
			var id = document.getElementById("id");
			document.getElementById("formUser").submit();
			
// 			if (id.value != '') {
// 			} else {
// 				alert('Usuario ainda não Cadastrado.')
// 			}
			
		}
	</script>
	<script type="text/javascript">
		function criaDeleteComAjax() {
			
			var urlAction = document.getElementById("formUser").action;
			var idUser = document.getElementById("id").value;
			
			$.ajax({
				
				method: "get",
				url : urlAction,
				data : "id=" + idUser + "&acao=deletarajax",
				success: function(response){
					alert(response);
					
					limparForm();
					document.getElementById("msgSucess").textContent = response;
				}
				
			}).fail(function(xhr, status, errorThrown){
				alert('Erro ao deletar usuario por id: ' + xhr.responseText);
			})
			
		}
	</script>
	
	

</body>
</html>
