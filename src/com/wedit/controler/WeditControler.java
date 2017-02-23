package com.wedit.controler;

import com.wedit.helper.DBHelper;
import com.wedit.helper.Selector;
import com.wedit.helper.Updatable;

class WeditControler {

    void getMember(int entity) throws ClassNotFoundException, InstantiationException, IllegalAccessException, Exception {
        DBHelper dBHelper = new DBHelper();
        Updatable member = Selector.getMember(entity);
        System.out.println("[1] za novi unos [2] za azuriranje [3] za brisanje [4] [GLAVNI_MENI]\n>");
        String select = dBHelper.scanner.next();
        switch (Integer.parseInt(select)) {
            case 1:
                member.insert();
                break;
            case 2:
                member.update();
                break;
            case 3:
                member.delete();
                break;
            case 4:
                WeditStart.startWedit();
        }
    }
}
