package util;

import java.util.Random;

public class CreateCodeUtil {
	public static String CreateCode(){
		String str="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder builder = new StringBuilder();
		for(int i=0;i<4;i++){
			char c=str.charAt(new Random().nextInt(str.length()));
			builder.append(c);
		}
		return builder.toString();
	}
	
	
}
