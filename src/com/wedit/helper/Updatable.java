package com.wedit.helper;

import java.sql.SQLException;

/**
 *
 * @author Vladimir
 */
public interface Updatable {

    boolean insert() throws SQLException, Exception;

    boolean update() throws SQLException, Exception;

    boolean delete() throws SQLException, Exception;
}
