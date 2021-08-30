package servlets;

import java.io.IOException;

import com.oracle.wls.shaded.org.apache.bcel.Repository;

import dao.DAOLoginRepository;
import dao.DAOUsuarioRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLogin;

@WebServlet(urlPatterns = { "/ServletLogin", "/principal/ServletLogin" }) // mapeamento de url que vem da tela
public class ServletLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;
	DAOLoginRepository repository = new DAOLoginRepository();

	public ServletLogin() {

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String acao = req.getParameter("acao");

		if (acao != null && acao.equalsIgnoreCase("logout")) {

			req.getSession().invalidate();
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
			requestDispatcher.forward(req, resp);

		} else {

			doPost(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String login = req.getParameter("login");
		String senha = req.getParameter("senha");
		String url = req.getParameter("url");

		try {

			if (login != null && !login.isEmpty() && senha != null && !senha.isEmpty()) {

				ModelLogin modelLogin = new ModelLogin();
				modelLogin.setLogin(login);
				modelLogin.setSenha(senha);

				if (repository.autenticao(modelLogin)) {
					
					DAOUsuarioRepository dao = new DAOUsuarioRepository();
					
					ModelLogin usuario = dao.consultarUsuario(login);
					

					req.getSession().setAttribute("usuario", usuario);

					if (url == null || url.equals("null")) {
						url = "principal/principal.jsp";
					}

					RequestDispatcher redirecionar = req.getRequestDispatcher(url);
					redirecionar.forward(req, resp);
				} else {

					RequestDispatcher redirecionar = req.getRequestDispatcher("/index.jsp");
					req.setAttribute("msg", "Login ou senha incorreto.");
					redirecionar.forward(req, resp);
				}

			} else {
				RequestDispatcher redirecionar = req.getRequestDispatcher("/index.jsp");
				req.setAttribute("msg", "Preencha os campos corretamento.");
				redirecionar.forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = req.getRequestDispatcher("erro.jsp");
			req.setAttribute("msg", e.getMessage());
			redirecionar.forward(req, resp);
		}
	}

}
