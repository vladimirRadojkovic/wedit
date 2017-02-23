package com.wedit.model;

import com.wedit.helper.DBConnection;
import com.wedit.helper.DBHelper;
import java.sql.Connection;
import java.sql.SQLException;
import com.wedit.helper.Updatable;

/**
 *
 * @author Vladimir
 */
public class City implements Updatable {

    DBHelper dBHelper = new DBHelper();

    @Override
    public boolean insert() throws SQLException, Exception {
        Connection connection = DBConnection.getInstance();
        dBHelper.statement = connection.createStatement();
        dBHelper.preparedStatement = connection.prepareStatement("insert into city (name, countrycode, district, population) values (?,?,?,?)");
        System.out.println("Unesite naziv grada:");
        dBHelper.preparedStatement.setString(1, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{1,35}"));
        System.out.println("Unesi countryCode drzave u kojoj se grad nalazi:");
        dBHelper.preparedStatement.setString(2, dBHelper.compareEntry("SELECT code from country"));
        System.out.println("Unesite distrikt u kom se nalazi grad:");
        dBHelper.preparedStatement.setString(3, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{1,35}"));
        System.out.println("Unesite broj stanovnika grada:");
        dBHelper.preparedStatement.setString(4, dBHelper.checkEntry("[0-9]{1,11}"));
        dBHelper.preparedStatement.execute();
        return dBHelper.preparedStatement.getUpdateCount() > 0;
    }

    @Override
    public boolean update() throws SQLException, Exception {
        Connection connection = DBConnection.getInstance();
        String query = "CALL cityChanger2(?,?,?,?)";
        dBHelper.preparedStatement = connection.prepareStatement(query);
        System.out.println("Unesite naziv grada koji azurirate:");
        dBHelper.preparedStatement.setString(1, dBHelper.compareEntry("SELECT name from city"));
        System.out.println("Unesite novi naziv grada ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(2, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{0,35}"));
        System.out.println("Unesite novi distrikt ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(3, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{0,35}"));
        System.out.println("Unesite novu populaciju ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(4, dBHelper.checkEntry("[0-9]{0,11}"));
        dBHelper.preparedStatement.execute();
        return dBHelper.preparedStatement.getUpdateCount() > 0;
    }

    @Override
    public boolean delete() throws SQLException, Exception {
        Connection connection = DBConnection.getInstance();
        dBHelper.statement = connection.createStatement();
        dBHelper.preparedStatement = connection.prepareStatement("DELETE from city WHERE name = ? AND countryCode = ?");
        System.out.println("Unesite naziv grada koji zelite da obrisete:");
        dBHelper.preparedStatement.setString(1, dBHelper.compareEntry("SELECT name from city"));
        System.out.println("Unesite KOD drzave iz koje briste grad:");
        dBHelper.preparedStatement.setString(2, dBHelper.compareEntry("SELECT code from country"));
        dBHelper.preparedStatement.execute();
        return dBHelper.preparedStatement.getUpdateCount() > 0;
    }
}
