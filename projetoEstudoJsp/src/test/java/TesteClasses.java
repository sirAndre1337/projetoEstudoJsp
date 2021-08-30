import java.sql.SQLException;

import org.junit.Test;

import dao.DAOLoginRepository;
import dao.DAOUsuarioRepository;
import model.ModelLogin;

public class TesteClasses {

	@Test
	public void testaAutenticar() throws Exception {

		DAOLoginRepository daoLoginRepository = new DAOLoginRepository();
		ModelLogin usuario = new ModelLogin();
		usuario.setLogin("123");
		usuario.setSenha("123");

		boolean autenticar = daoLoginRepository.autenticao(usuario);

		if (autenticar) {
			System.out.println("Autenticou");
		} else {
			System.out.println("Usuario invalido");
		}

	}

	@Test
	public void testaSalvarEAtualizar() {
		DAOUsuarioRepository dao = new DAOUsuarioRepository();
		ModelLogin modelLogin = new ModelLogin();
		modelLogin.setNome("Roberto");
		modelLogin.setLogin("roberto");
		modelLogin.setSenha("admin");
		modelLogin.setEmail("roberto@gmail.com");

		try {
			dao.salvar(modelLogin);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@Test
	public void testaOCapeta() {
		
		DAOUsuarioRepository dao = new DAOUsuarioRepository();
		ModelLogin consultarUsuario;
		try {
			consultarUsuario = dao.consultarUsuario("yyy");
			System.out.println(consultarUsuario);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
