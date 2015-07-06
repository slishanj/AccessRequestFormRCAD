/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class TimestampClass {

    private ResultSet resultSet = null;
    private Statement statement = null;
    private PreparedStatement preparedStatement = null;
    private Connection connection = null;
    private String fullTimestamp = null;

    public TimestampClass() {
        try {
            setConnection(jdbc.getConnection());
            setStatement(getConnection().createStatement());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     *
     * @param action String to set to define the action done
     * @return <code>idtimestamp</code> - integer value assigned with ID of last
     * transaction + fulltimestamp now
     */
    public String setTimestamp(String action) {
        int idtimestamp = 0;
        try {

            fullTimestamp = new Date().toString();
            setPreparedStatement(getConnection().prepareStatement("INSERT INTO timestamp(action,create_time)"
                    + " VALUES(?,?)"));
            getPreparedStatement().setString(1, action);
            getPreparedStatement().setString(2, fullTimestamp);
            getPreparedStatement().executeUpdate();

            setResultSet(getStatement().executeQuery("SELECT idtimestamp FROM timestamp ORDER BY idtimestamp DESC LIMIT 1"));
            // get the just inserted timestamp and assign to a string
            if (getResultSet().first()) {
                idtimestamp = getResultSet().getInt("idtimestamp");
                return String.valueOf(idtimestamp) + ":" + fullTimestamp;
                // now return this to the method caller :)
            }else{
                return null;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            if (getResultSet() != null) {
                try {
                    getResultSet().close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }

            if (getPreparedStatement() != null) {
                try {
                    getPreparedStatement().close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }
    }

    /**
     * @return the con
     */
    private Connection getConnection() {
        return connection;
    }

    /**
     * @param con the con to set
     */
    private void setConnection(Connection con) {
        this.connection = con;
    }

    /**
     * @return the st
     */
    private Statement getStatement() {
        return statement;
    }

    /**
     * @param st the st to set
     */
    private void setStatement(Statement st) {
        this.statement = st;
    }

    /**
     *
     * @return <code>fullTimestamp</code> - a new timestamp of right now
     */
    public String getNewTimestamp() {
        String fullTimestamp = new Date().toString();
        return fullTimestamp;
    }

    /**
     * @return the resultSet
     */
    private ResultSet getResultSet() {
        return resultSet;
    }

    /**
     * @param resultSet the resultSet to set
     */
    private void setResultSet(ResultSet resultSet) {
        this.resultSet = resultSet;
    }

    /**
     * @return the preparedStatement
     */
    private PreparedStatement getPreparedStatement() {
        return preparedStatement;
    }

    /**
     * @param preparedStatement the preparedStatement to set
     */
    private void setPreparedStatement(PreparedStatement preparedStatement) {
        this.preparedStatement = preparedStatement;
    }
   
}
