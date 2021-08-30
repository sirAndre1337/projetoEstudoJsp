package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import model.ModelLogin;

@WebFilter(urlPatterns = { "/principal/*" }) // Intercepta todas as requisicoes.
public class FilterAutenticao implements Filter {

	private static Connection connection;

	public FilterAutenticao() {
	}

	// Encerra os processo quando o servidor é parado
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Intercept todas as req e resp do sistema
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

			try {
				HttpServletRequest req = (HttpServletRequest) request;
				ModelLogin usuarioLogado = (ModelLogin) req.getSession().getAttribute("usuario");
	
				String urlParaAutenticar = req.getServletPath();// Url que esta sendo acessada
	
				// Validar se esta logado
				if (usuarioLogado == null && !urlParaAutenticar.contains("/principal/ServletLogin")) {
	
					RequestDispatcher requestDispatcher = request
							.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
					request.setAttribute("msg", "Por favor realize o login.");
					requestDispatcher.forward(request, response);
					return; // para a execucao e redireciona para a pag de login
	
				} else {
					chain.doFilter(request, response);
				}
				
				connection.commit();
				
			} catch (Exception e) {
			e.printStackTrace();
			
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	// Inicia os processos ao starta o servidor
	public void init(FilterConfig filterConfig) throws ServletException {
		connection = SingleConnectionBanco.getConnection();

	}

}
