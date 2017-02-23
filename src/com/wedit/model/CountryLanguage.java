package com.wedit.model;

import com.wedit.helper.DBConnection;
import java.sql.Connection;
import java.sql.SQLException;
import com.wedit.helper.DBHelper;
import com.wedit.helper.Updatable;

/**
 *
 * @author Vladimir
 */
public class CountryLanguage implements Updatable {

    DBHelper dBHelper = new DBHelper();

    @Override
    public boolean insert() throws SQLException, Exception {
        Connection connection = DBConnection.getInstance();
        dBHelper.statement = connection.createStatement();
        dBHelper.preparedStatement = connection.prepareStatement("CALL jezikUnos(?,?,?,?)");
        System.out.println("Unesite countryCode drzave kojoj dodajete jezik:");
        dBHelper.preparedStatement.setString(1, dBHelper.compareEntry("SELECT code from country"));
        System.out.println("Unesite novi jezik:");
        dBHelper.preparedStatement.setString(2, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{1,30}"));
        System.out.println("Ako je jezik oficijalni unesite <T> ako nije <F> ili <ENTER> za dalje...:");
        dBHelper.preparedStatement.setString(3, dBHelper.checkEntry("[TF_tf]*"));
        System.out.println("Unesite procenat koriscenja jezika ili <ENTER> za dalje...:");
        dBHelper.preparedStatement.setString(4, dBHelper.checkEntry("^(\\d{0,3}\\.\\d{0,2})?$"));
        dBHelper.preparedStatement.execute();
        return dBHelper.preparedStatement.getUpdateCount() > 0;
    }

    @Override
    public boolean update() throws SQLException, Exception {
        Connection connection = DBConnection.getInstance();
        dBHelper.statement = connection.createStatement();
        dBHelper.preparedStatement = connection.prepareStatement("CALL izmeniJezik(?,?,?,?,?)");
        System.out.println("Unesi <KOD> zemlje u kojoj menjas jezik:");
        dBHelper.preparedStatement.setString(1, dBHelper.compareEntry("SELECT code from country"));
        System.out.println("Unesite naziv jezika koji se menja ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(2, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{0,30}"));
        System.out.println("Unesite novi naziv jezika ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(3, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{0,30}"));
        System.out.println("Ako je jezik oficijalni unesite <T> ako nije <F> ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(4, dBHelper.checkEntry("[TF_tf]*"));
        System.out.println("Unesite novi procenat koriscenja jezika ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(5, dBHelper.checkEntry("^(\\d{0,3}\\.\\d{0,2})?$"));
        dBHelper.preparedStatement.execute();
        return dBHelper.preparedStatement.getUpdateCount() > 0;
    }

    @Override
    public boolean delete() throws SQLException, Exception {
        Connection connection = DBConnection.getInstance();
        dBHelper.statement = connection.createStatement();
        dBHelper.preparedStatement = connection.prepareStatement("DELETE from countrylanguage WHERE language = ? AND countryCode = ?");
        System.out.println("Unesite naziv jezika koji zelite da obrisete:");
        dBHelper.preparedStatement.setString(1, dBHelper.compareEntry("SELECT language from countrylanguage"));
        System.out.println("Unesite KOD drzave iz koje brisete jezik:");
        dBHelper.preparedStatement.setString(2, dBHelper.compareEntry("SELECT code from country"));
        dBHelper.preparedStatement.execute();
        return dBHelper.preparedStatement.getUpdateCount() > 0;
    }
}
