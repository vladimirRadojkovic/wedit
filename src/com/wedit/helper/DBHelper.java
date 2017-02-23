package com.wedit.helper;

import java.io.IOException;
import java.sql.*;
import java.util.Scanner;
import com.wedit.controler.WeditStart;
import com.wedit.helper.*;

/*
 *
 * @author Vladimir
 */
public class DBHelper {

    public Scanner scanner = new Scanner(System.in);
    public Statement statement;
    public PreparedStatement preparedStatement;

    void exit(String var) {
        if (var.equalsIgnoreCase("q")) {
            WeditStart.startWedit();
        }
    }

    public String checkEntry(String regex) throws IOException, Exception {
        System.out.println("Za pocetni meni pritisnite taster [q]");
        String selekt = scanner.nextLine();
        exit(selekt);
        if (selekt.matches(regex)) {
            return selekt;
        }
        System.err.println("Nekorektan unos, pokusajte ponovo...");
        return checkEntry(regex);
    }

    public String compareEntry(String query) throws Exception {
        System.out.println("Za pocetni meni pritisnite taster [q]");
        String naziv = scanner.nextLine();
        exit(naziv);
        if (!checker(naziv, query)) {
            System.err.println("Nekorektan unos, pokusajte ponovo...");
            return DBHelper.this.compareEntry(query);
        }
        if (naziv.length() == 3) {
            return naziv.toUpperCase();
        }
        return naziv;
    }

    public String compareEntry(String query, String patern) throws Exception {
        System.out.println("Za pocetni meni pritisnite taster [q]");
        String naziv = scanner.nextLine();
        exit(naziv);
        if (checker(naziv, query) == false && naziv.matches(patern) == true) {
            return naziv;
        }
        System.err.println("Nekorektan unos, pokusajte ponovo...");
        return compareEntry(query, patern);
    }

    public boolean checker(String polje, String upit) throws SQLException {
        boolean check = false;
        Connection connection = DBConnection.getInstance();
        statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(upit);
        while (rs.next()) {
            if (polje.equalsIgnoreCase(rs.getString(1))) {
                check = true;
            }
        }
        return check;
    }
}
