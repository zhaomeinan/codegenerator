package com.weahan.utility.codegenerator.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.weahan.utility.codegenerator.config.DataSourceConfig;

public class ConnectionFactory {
    private static Connection conn;


    public ConnectionFactory() {
        super();
    }

    public static Connection getConnection(DataSourceConfig cfg) {
//        if (conn == null) {
        try {
            Class.forName(cfg.getConnectionDriver());
            try {
                conn = DriverManager.getConnection(cfg.getConnectionUrl(),
                        cfg.getConnectionUser(), cfg.getConnectionPass());
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
//        }
        return conn;
    }
}
