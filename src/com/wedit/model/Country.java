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
public class Country implements Updatable {

    DBHelper dBHelper = new DBHelper();

    @Override
    public boolean insert() throws SQLException, Exception {
        Connection connection = DBConnection.getInstance();
        dBHelper.statement = connection.createStatement();
        dBHelper.preparedStatement = connection.prepareStatement("CALL unesiDrzavu1(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        System.out.println("Unesite <KOD> drzave:");
        dBHelper.preparedStatement.setString(1, dBHelper.compareEntry("SELECT code from country", "[a-zA-Z]{3}"));
        System.out.println("Unesite naziv drzave:");
        dBHelper.preparedStatement.setString(2, dBHelper.compareEntry("SELECT name from country", "[a-zA-Z\\p{IsWhite_Space}]{1,35}"));
        System.out.println("Unesite kontinent:");
        dBHelper.preparedStatement.setString(3, dBHelper.compareEntry("SELECT distinct Continent from country"));
        System.out.println("Unesite region:");
        dBHelper.preparedStatement.setString(4, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{1,26}"));
        System.out.println("Unesite povrsinu ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(5, dBHelper.checkEntry("^(\\d{0,8}\\.\\d{0,2})?$"));
        System.out.println("Unesite godinu nezavisnosti ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(6, dBHelper.checkEntry("[0-9]{0,6}"));
        System.out.println("Unesite broj stanovnika ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(7, dBHelper.checkEntry("[0-9]{0,11}"));
        System.out.println("Unesite prosecan zivotni vek ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(8, dBHelper.checkEntry("^(\\d{0,2}\\.\\d{0,1})?$"));
        System.out.println("Unesite BDP ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(9, dBHelper.checkEntry("^(\\d{0,8}\\.\\d{0,2})?$"));
        System.out.println("Unesite BDP_old ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(10, dBHelper.checkEntry("^(\\d{0,8}\\.\\d{0,2})?$"));
        System.out.println("Unesite localni naziv drzave:");
        dBHelper.preparedStatement.setString(11, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{1,45}"));
        System.out.println("Unesite tip Drzavnog uredjenja:");
        dBHelper.preparedStatement.setString(12, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{1,45}"));
        System.out.println("Unesite aktuelnog predsednika ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(13, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{0,60}"));
        System.out.println("Unesite broj glavnog grada ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(14, dBHelper.checkEntry("[0-9]{0,11}"));
        System.out.println("Unesite KOD_2 (max. 2 Karaktera):");
        dBHelper.preparedStatement.setString(15, dBHelper.compareEntry("SELECT Code2 from country", "[a-zA-Z]{2}"));
        dBHelper.preparedStatement.execute();
        return dBHelper.preparedStatement.getUpdateCount() > 0;
    }

    @Override
    public boolean update() throws SQLException, Exception {
        Connection connection = DBConnection.getInstance();
        dBHelper.statement = connection.createStatement();
        dBHelper.preparedStatement = connection.prepareStatement("CALL promeniDrzavu(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        System.out.println("Unesite <KOD> drzave koja se menja:");
        dBHelper.preparedStatement.setString(1, dBHelper.compareEntry("SELECT code from country"));
        System.out.println("Izmeni naziv drzave ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(2, dBHelper.compareEntry("SELECT name from country", "[a-zA-Z\\p{IsWhite_Space}]{0,35}"));
        System.out.println("Izmeni kontinent ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(3, dBHelper.checkEntry("[a-zA-Z]{0,12}"));
        System.out.println("Izmeni region ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(4, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{0,26}"));
        System.out.println("Izmeni povrsinu ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(5, dBHelper.checkEntry("^(\\d{0,8}\\.\\d{0,2})?$"));
        System.out.println("Izmeni godinu nezavisnosti ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(6, dBHelper.checkEntry("[0-9]{0,6}"));
        System.out.println("Izmeni broj stanovnika ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(7, dBHelper.checkEntry("[0-9]{0,11}"));
        System.out.println("Izmeni prosecan zivotni vek ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(8, dBHelper.checkEntry("^(\\d{0,2}\\.\\d{0,1})?$"));
        System.out.println("Izmeni BDP ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(9, dBHelper.checkEntry("^(\\d{0,8}\\.\\d{0,2})?$"));
        System.out.println("Izmeni BDP_old ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(10, dBHelper.checkEntry("^(\\d{0,8}\\.\\d{0,2})?$"));
        System.out.println("Izmeni localni naziv drzave ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(11, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{0,45}"));
        System.out.println("Izmeni tip Drzavnog uredjenja ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(12, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{0,45}"));
        System.out.println("Izmeni aktuelnog predsednika ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(13, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{0,60}"));
        System.out.println("Izmeni broj glavnog grada ili <ENTER> za dalje:");
        dBHelper.preparedStatement.setString(14, dBHelper.checkEntry("[0-9]{0,11}"));
        System.out.println("Izmeni KOD_2 (max. 2 Karaktera):");
        dBHelper.preparedStatement.setString(15, dBHelper.compareEntry("SELECT Code2 from country", "[a-zA-Z]{0,2}"));
        dBHelper.preparedStatement.execute();
        return dBHelper.preparedStatement.getUpdateCount() > 0;
    }

    @Override
    public boolean delete() throws SQLException, Exception {
        Connection connection = DBConnection.getInstance();
        dBHelper.statement = connection.createStatement();
        dBHelper.preparedStatement = connection.prepareStatement("DELETE from country WHERE name = ?");
        System.out.println("Unesite naziv Drzave za brisanje:");
        dBHelper.preparedStatement.setString(1, dBHelper.checkEntry("[a-zA-Z\\p{IsWhite_Space}]{1,35}"));
        dBHelper.preparedStatement.execute();
        return dBHelper.preparedStatement.getUpdateCount() > 0;
    }
}
