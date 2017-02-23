package com.wedit.helper;

import com.wedit.model.City;
import com.wedit.model.Country;
import com.wedit.model.CountryLanguage;

/**
 *
 * @author Vladimir
 */
public class Selector {

    public static final int CITY = 1;
    public static final int COUNTRY = 2;
    public static final int COUNTRYLANGUAGE = 3;

    public static Updatable getMember(int member) {
        Updatable updatable = null;
        switch (member) {
            case 1:
                updatable = new City();
                break;
            case 2:
                updatable = new Country();
                break;
            case 3:
                updatable = new CountryLanguage();
                break;
        }
        return updatable;
    }
}
