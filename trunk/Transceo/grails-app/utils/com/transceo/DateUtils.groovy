package com.transceo

import java.text.SimpleDateFormat;

class DateUtils {
	private static final SimpleDateFormat DD_MM_YYYY = new SimpleDateFormat("dd/MM/yyyy")
	private static final SimpleDateFormat DD_MM_YYYY_HHMM = new SimpleDateFormat("dd/MM/yyyy HH:mm")
	
	public static Date parseDate(String date){
		def d
		try{
			d = DD_MM_YYYY.parse(date) 
		}catch (Exception e) {
			// Nothing
		}
		return d
	}
	
	public static Date parseDateTime(String date, int hour, int minute){
		def d
		try{
			d = DD_MM_YYYY_HHMM.parse(date + " " + hour + ":" + minute) 
		}catch (Exception e) {
			// Nothing
		}
	}
}
