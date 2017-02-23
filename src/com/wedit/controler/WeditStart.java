package com.wedit.controler;

import java.sql.SQLException;
import com.wedit.helper.DBHelper;
import com.wedit.helper.Selector;

/**
 *
 * @author Vladimir
 */
public class WeditStart {

    static WeditControler appControler = new WeditControler();
    static DBHelper dBHelper = new DBHelper();
    static String choise;

    @SuppressWarnings("InfiniteRecursion")
    public static void startWedit() {
        while (true) {
            try {
                System.out.println("[1] za tabelu city [2] za tabelu cityLanguage [3] za tabelu country [4] [IZLAZ]\n>");
                choise = dBHelper.scanner.next();
                switch (Integer.parseInt(choise)) {
                    case 1:
                        appControler.getMember(Selector.CITY);
                        break;
                    case 2:
                        appControler.getMember(Selector.COUNTRY);
                        break;
                    case 3:
                        appControler.getMember(Selector.COUNTRYLANGUAGE);
                        break;
                    case 4:
                        System.exit(0);
                    default:
                        throw new AssertionError();
                }
            } catch (ClassNotFoundException | IllegalAccessException | InstantiationException e) {
            } catch (NumberFormatException | AssertionError ex) {
                System.err.println("Ne postojeca opcija, pokusajte ponovo!");
                startWedit();
            } catch (SQLException e) {
                return;
            } catch (Exception e) {
                return;
            }
        }
    }

    public static void main(String[] args) {
        WeditStart.startWedit();
    }
}
