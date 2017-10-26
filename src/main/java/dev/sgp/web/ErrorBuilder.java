package dev.sgp.web;

public class ErrorBuilder {

	public static String buildError(String... params){
		String error = "";
		for (String param : params) {
			String[] strings = param.split(":");
			if(strings[1].trim().equals("null")){
				error+=strings[0] + ". ";
			}
		}
		return error;
	}
}
