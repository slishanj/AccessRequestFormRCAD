package src;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author joshua
 */
public class jdbc {

    final static String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
    final static String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
    final static String username = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
    final static String password = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
    final static String url = "jdbc:mysql://" + host + ":" + port + "/ritzform";

//    final static String url = "jdbc:mysql://localhost:3306/ritz_access";
    private static Connection connection;

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);
//        connection = DriverManager.getConnection(url, "root", "SLISHAN");
        return connection;
    }
//
//    public void putdata(String sql) throws Exception {
//        Connection conc = getConnection();
//        Statement st = conc.createStatement();
//        st.executeUpdate(sql);
//        //conc = null;
//    }
//
//    public ResultSet getdata(String sql) throws Exception {
//        Statement st = getConnection().createStatement();
//        ResultSet rset = st.executeQuery(sql);
//        return rset;
//    }

}
