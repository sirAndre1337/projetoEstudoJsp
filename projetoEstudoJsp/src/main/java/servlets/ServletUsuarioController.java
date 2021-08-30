package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DAOUsuarioRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLogin;

@WebServlet(urlPatterns = { "/ServletUsuarioController", "/principal/ServletUsuarioController" })
public class ServletUsuarioController extends HttpServlet {

	DAOUsuarioRepository dao = new DAOUsuarioRepository();
	private static final long serialVersionUID = 1L;

	public ServletUsuarioController() {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String acao = req.getParameter("acao");
		String id = req.getParameter("id");

		try {

			if (id == "") {
				req.setAttribute("msg2", "Usuario ainda não Cadastrado.");
				List<ModelLogin> usuarios = dao.listaUsuarios();
				req.setAttribute("ModelLogins", usuarios);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("principal/usuario.jsp");
				requestDispatcher.forward(req, resp);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("pesquisar")) {

				Long idConvertido = Long.parseLong(id);

				ModelLogin ModelLogin = dao.consultarUsuarioPorId(idConvertido);

				req.setAttribute("ModelLogin", ModelLogin);
				req.setAttribute("msg", "Operacao realizada com sucesso.");
				List<ModelLogin> usuarios = dao.listaUsuarios();
				req.setAttribute("ModelLogins", usuarios);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("principal/usuario.jsp");
				requestDispatcher.forward(req, resp);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarUserAjax")) {

				String nomeBusca = req.getParameter("nomeBusca");
				List<ModelLogin> usuarios = dao.pesquisaPorNome(nomeBusca);

				ObjectMapper objectMapper = new ObjectMapper();
				String json = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(usuarios);
				resp.getWriter().write(json);

			}

			else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletar")) {
				Long idUser = (Long.parseLong(req.getParameter("id")));

				dao.excluirPorid(idUser);
				req.setAttribute("msg", "Usuário excluido com sucesso.");
				List<ModelLogin> usuarios = dao.listaUsuarios();
				req.setAttribute("ModelLogins", usuarios);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("principal/usuario.jsp");
				requestDispatcher.forward(req, resp);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarajax")) {
				Long idUser = (Long.parseLong(req.getParameter("id")));

				dao.excluirPorid(idUser);
				resp.getWriter().write("Usuário excluido com sucesso");
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listarUser")) {

				List<ModelLogin> usuarios = dao.listaUsuarios();
				req.setAttribute("ModelLogins", usuarios);
				req.getRequestDispatcher("/principal/usuario.jsp").forward(req, resp);

			}

		} catch (SQLException e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = req.getRequestDispatcher("erro.jsp");
			req.setAttribute("msgErro", e.getMessage());
			redirecionar.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String nome = req.getParameter("nome");
		String login = req.getParameter("login");
		String senha = req.getParameter("senha");
		String email = req.getParameter("email");
		String foto = req.getParameter("foto");

		ModelLogin ModelLogin = new ModelLogin();
		ModelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
		ModelLogin.setNome(nome);
		ModelLogin.setLogin(login);
		ModelLogin.setSenha(senha);
		ModelLogin.setEmail(email);
		ModelLogin.setFoto(foto);
		

		try {

			if (dao.verificaLoginExistente(login)) {

				req.setAttribute("ModelLogin", ModelLogin);
				req.setAttribute("msg2", "Login existente, escolha outro por favor.");
				List<ModelLogin> usuarios = dao.listaUsuarios();
				req.setAttribute("ModelLogins", usuarios);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("principal/usuario.jsp");
				requestDispatcher.forward(req, resp);

			} else {

				ModelLogin = dao.salvar(ModelLogin);

				req.setAttribute("ModelLogin", ModelLogin);
				req.setAttribute("msg", "Usuario Cadastrado.");
				List<ModelLogin> usuarios = dao.listaUsuarios();
				req.setAttribute("ModelLogins", usuarios);
				RequestDispatcher requestDispatcher = req.getRequestDispatcher("principal/usuario.jsp");
				requestDispatcher.forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = req.getRequestDispatcher("erro.jsp");
			req.setAttribute("msgErro", e.getMessage());
			redirecionar.forward(req, resp);
		}

	}
}
