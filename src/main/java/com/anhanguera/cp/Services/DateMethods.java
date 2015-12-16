package com.anhanguera.cp.Services;

import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

/**
 * Created by psalum on 07/05/2015.
 */
@Component
public class DateMethods {


    public static String GetDate() {
        Locale locale = new Locale("pt", "BR");
        GregorianCalendar calendar = new GregorianCalendar();
        SimpleDateFormat formatador = new SimpleDateFormat(
                "dd/MM/yyyy", locale);
        return formatador.format(calendar.getTime());
    }
}
