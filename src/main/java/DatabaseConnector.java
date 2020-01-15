import java.sql.*;

public class DatabaseConnector {
    private static String dbDriver = "org.postgresql.Driver";
    private static String dbName = "jdbc:postgresql://localhost:5432/JavaSimpleLoginRegister";
    private static String dbUser = "breznar-test";
    private static String dbUserPassw = "BrkataSinica";

    public static Connection getConn() {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection(dbName, dbUser, dbUserPassw);
            return conn;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
