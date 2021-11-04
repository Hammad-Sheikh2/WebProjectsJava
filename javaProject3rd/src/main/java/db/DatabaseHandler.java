package db;

import java.sql.*;

public class DatabaseHandler {

    public final String dbDriver = "com.mysql.jdbc.Driver";
    Connection conn;
    public final String host = "jdbc:mysql://localhost/";
    public final String user = "root";
    public final String pass = "1234";
    public final String db = "jad?serverTimezone=UTC";

    public DatabaseHandler() throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);
        conn = DriverManager.getConnection(host+db, user, pass);
    }

    public int executeSQLStatement(String sql, Object... parameters) throws SQLException {

        PreparedStatement statement = conn.prepareStatement(sql);

        for (int i = 0; i < parameters.length; i++)
            statement.setObject(i + 1, parameters[i]);

        return statement.executeUpdate();
    }
    public int insertQuery(String sql, Object... parameters) throws SQLException {
        PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        for (int i = 0; i < parameters.length; i++)
            statement.setObject(i + 1, parameters[i]);
        int recordsAdded = statement.executeUpdate();
        if(recordsAdded==0)
            return 0;
        ResultSet rs=statement.getGeneratedKeys();
        if(rs.next())
            return rs.getInt(1);
        return 0;
    }
    public ResultSet getData(String sql, Object... parameters) throws SQLException {

        PreparedStatement statement = conn.prepareStatement(sql);

        for (int i = 0; i<parameters.length; i++)
            statement.setObject(i+1, parameters[i]);

        return statement.executeQuery();
    }
}
