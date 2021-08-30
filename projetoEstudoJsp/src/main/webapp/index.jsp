<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Login no Sistema</title>

<jsp:include page="/principal/head.jsp"></jsp:include>

</head>

<body themebg-pattern="theme1">

	<jsp:include page="/principal/pre-load.jsp"></jsp:include>

	<section class="login-block">
		<!-- Container-fluid starts -->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<!-- Authentication card start -->

					<form class="md-float-material form-material needs-validation"
						action="<%= request.getContextPath() %>/ServletLogin" method="post">
						<input type="hidden" value="<%=request.getParameter("url")%>"
							name="url">
						<div class="auth-box card">
							<div class="card-block">
								<div class="row m-b-20">
									<div class="col-md-12">
										<h3 class="text-center">Entrar</h3>
									</div>
								</div>
								<div class="form-group form-primary">
									<input type="text" name="login"
										class="form-control form-control-default" required> <span
										class="form-bar"></span> <label class="float-label">Usuario</label>
								</div>
								<div class="form-group form-primary">
									<input type="password" name="senha"
										class="form-control form-control-default" required> <span
										class="form-bar"></span> <label class="float-label">Senha</label>
								</div>
								<div class="row m-t-25 text-left">
									<div class="col-12">
										<div class="checkbox-fade fade-in-primary">
										    <label>
										        <input type="checkbox" value="">
										            <span class="cr">
										                <i class="cr-icon fa fa-check txt-primary"></i>
										            </span> <span>Lembrar dados</span>
										    </label>
										</div>
										<div class="forgot-phone text-right f-right">
											<a href="#" class="text-right f-w-600"> Esqueceu a senha
												?</a>
										</div>
									</div>
								</div>
								<div class="row m-t-30">
									<div class="col-md-12">
										<button type="submit"
											class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">Entrar</button>
									</div>
								</div>
								<hr />
									<span id ="msg" class="text-pink" style="display:none">
										${msg}
									</span>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="/principal/javascriptdohtml.jsp"></jsp:include>
	<script type="text/javascript">
	
	$(window).on('load',function(){
		
		var msg = document.getElementById("msg").textContent;
		
		
		if (msg != '' && msg != '\n\t\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t') {
			
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
			
			notificar(msg , 'danger');
			
		}
			
		
		
		
		})
	
	
	</script>

</html>
