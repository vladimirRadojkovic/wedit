package com.wedit.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vladimir
 */
public class DBConnection {

    private static Connection connection;

    private DBConnection() {

    }

    public static Connection getInstance() {
        if (connection == null) {
            try {
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "", "");
            } catch (SQLException ex) {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return connection;
    }
}
