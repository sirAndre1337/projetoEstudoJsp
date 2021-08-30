package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {
	private Connection connection;

	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public ModelLogin salvar(ModelLogin modelLogin) throws Exception {
		String sql;

		if (modelLogin.getId() != null) {
			sql = "update model_login set login = ? , senha = ? , nome = ? , email = ? , foto = ? where id = "
					+ modelLogin.getId();
		} else {
			sql = "insert into model_login (login , senha , nome , email , foto) values ( ?, ? , ? , ? , ?)";
		}

		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1, modelLogin.getLogin());
		prepareStatement.setString(2, modelLogin.getSenha());
		prepareStatement.setString(3, modelLogin.getNome());
		prepareStatement.setString(4, modelLogin.getEmail());
		prepareStatement.setString(5, modelLogin.getFoto());
		prepareStatement.execute();
		connection.commit();

		return this.consultarUsuario(modelLogin.getLogin());

	}

	public ModelLogin consultarUsuario(String login) throws SQLException {

		ModelLogin usuario = new ModelLogin();

		String sql = "select * from model_login where login = '" + login + "'";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.executeQuery();
		ResultSet resultSet = preparedStatement.executeQuery();

		if (resultSet.next()) {
			usuario.setLogin(login);
			usuario.setId(resultSet.getLong("id"));
			usuario.setNome(resultSet.getString("nome"));
			usuario.setSenha(resultSet.getString("senha"));
			usuario.setEmail(resultSet.getString("email"));
			usuario.setFoto(resultSet.getString("foto"));
		}

		return usuario;

	}

	public boolean verificaLoginExistente(String login) throws SQLException {

		String sql = "select * from model_login where login = '" + login + "'";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.executeQuery();
		ResultSet resultSet = preparedStatement.executeQuery();

		if (resultSet.next()) {
			return true;
		}

		return false;
	}

	public void excluirPorid(Long id) throws SQLException {

		String sql = "delete from model_login where id = " + id;
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		prepareStatement.execute();
		connection.commit();

	}


	public List<ModelLogin> pesquisaPorNome(String nome) throws SQLException {
		List<ModelLogin> usuarios = new ArrayList<ModelLogin>();

		String sql = "select * from model_login where upper(nome) like upper('%" + nome + "%')";
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		ResultSet resultSet = prepareStatement.executeQuery();

		while (resultSet.next()) {
			ModelLogin usuario = new ModelLogin();
			usuario.setId(resultSet.getLong("id"));
			usuario.setLogin(resultSet.getString("login"));
			usuario.setNome(resultSet.getString("nome"));
			usuario.setSenha(resultSet.getString("senha"));
			usuario.setEmail(resultSet.getString("email"));
			usuario.setFoto(resultSet.getString("foto"));

			usuarios.add(usuario);
		}

		return usuarios;
	}
	
	public ModelLogin consultarUsuarioPorId(Long id) throws Exception {
		
		ModelLogin usuario = new ModelLogin();

		String sql = "select * from model_login where id = " + id;
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.executeQuery();
		ResultSet resultSet = preparedStatement.executeQuery();

		if (resultSet.next()) {
			usuario.setLogin(resultSet.getString("login"));
			usuario.setId(resultSet.getLong("id"));
			usuario.setNome(resultSet.getString("nome"));
			usuario.setSenha(resultSet.getString("senha"));
			usuario.setEmail(resultSet.getString("email"));
			usuario.setFoto(resultSet.getString("foto"));
		}

		return usuario;
		
	}
	
	public List<ModelLogin> listaUsuarios() throws Exception {
		List<ModelLogin> usuarios = new ArrayList<ModelLogin>();
		
		String sql = "select * from model_login";
		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		ResultSet resultSet = prepareStatement.executeQuery();
		
		while (resultSet.next()) {
			ModelLogin usuario = new ModelLogin();
			usuario.setId(resultSet.getLong("id"));
			usuario.setLogin(resultSet.getString("login"));
			usuario.setNome(resultSet.getString("nome"));
			usuario.setSenha(resultSet.getString("senha"));
			usuario.setEmail(resultSet.getString("email"));
			usuario.setFoto(resultSet.getString("foto"));

			usuarios.add(usuario);
		}
		
		return usuarios;
	}

}
