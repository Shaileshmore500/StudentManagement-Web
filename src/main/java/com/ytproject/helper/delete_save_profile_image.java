package com.ytproject.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class delete_save_profile_image {
	
	public static boolean delete_image(String old_img_path) {
		boolean f= false;
		
		File file = new File(old_img_path);
		file.delete();
		
		f=true;
		System.out.println("delete"+old_img_path);
		return f;
		
		
	}
	public static boolean save_img(InputStream inst , String path) {
		
		boolean f= false;
		try {
			byte b[] = new byte[inst.available()];
			inst.read(b);
			
			FileOutputStream fos = new FileOutputStream(path);
			
			fos.write(b);
			fos.flush();
			fos.close();
			f = true;
			System.out.println("save   "+path);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		return f;
		
	}

}
