package com.dn.common.utils;

import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ValidationUtils {
	private static final Logger logger = LoggerFactory.getLogger(ValidationUtils.class);

	private ValidationUtils() {}
	
	public static boolean isNull( Object obj) {
		if ( obj == null)
			return true;
		else 
			return false;
	}
	
	public static boolean isNotNull( Object obj) {
		return !isNull(obj);
	}
	
	public static boolean isNull( List<?> list) {
		if ( list.isEmpty() || list == null)
			return true;
		return false;
	}
	
	public static boolean isNull( Set<?> set) {
		if ( set.isEmpty() || set == null)
			return true;
		return false;
	}
	
	public static boolean isNull( Object ...objs) {
		for (Object obj : objs) {
			if ( isNull(obj)) return true;
		}
		return false;
	}
	
	public static boolean isNotNull( Object ...objs) {
		return !isNull(objs);
	}
	
	public static boolean isEmpty(String text) {
		return isNull(text) || text.equals("");
	}
	
	public static boolean isEmpty(int id) {
		return isNull(id) || id == 0;
	}
	
	
	
}
