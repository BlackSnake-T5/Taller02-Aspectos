import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

public aspect Logger {

    File file = new File("log.txt");
    Date date = new Date();   // given date
    
    pointcut trans1() : call(void moneyMakeTransaction());
    after() : trans1() {
    	Calendar calendar = Calendar.getInstance();
        int horas=calendar.get(Calendar.HOUR_OF_DAY);
        int minutos=calendar.get(Calendar.MINUTE);
        int segundos=calendar.get(Calendar.SECOND);
    	try {
    		FileWriter w = new FileWriter(file,true);
    		String msj=("a. Realizar transacción: "+horas+":"+minutos+":"+segundos+"\n");
    		w.write(msj);
    		w.close();
    		System.out.println(msj);
    	}catch(IOException e){
    		System.out.println("**** Error al escribir ****");
    	}	
    }	
    pointcut trans2() : call(void moneyWithdrawal());
    after() : trans2() {
    	Calendar calendar = Calendar.getInstance();
        int horas=calendar.get(Calendar.HOUR_OF_DAY);
        int minutos=calendar.get(Calendar.MINUTE);
        int segundos=calendar.get(Calendar.SECOND);
    	try {
    		FileWriter w = new FileWriter(file,true);
    		String msj=("b. Retirar dinero: "+horas+":"+minutos+":"+segundos+"\n");
    		w.write(msj);
    		w.close();
    		System.out.println(msj);
    	}catch(IOException e){
    		System.out.println("**** Error al escribir ****");
    	}
    }	
}