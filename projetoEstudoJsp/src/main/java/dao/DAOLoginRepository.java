package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOLoginRepository {

	private Connection connection;

	public DAOLoginRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public boolean autenticao(ModelLogin ml) throws Exception {

		String sql = "select * from model_login where upper(login) = upper(?) and upper(senha) = upper(?)";

		PreparedStatement prepareStatement = connection.prepareStatement(sql);
		prepareStatement.setString(1, ml.getLogin());
		prepareStatement.setString(2, ml.getSenha());

		ResultSet resultSet = prepareStatement.executeQuery();

		if (resultSet.next()) {
			return true; // autenticado
		}

		return false; // nao autenticado

	}

}
