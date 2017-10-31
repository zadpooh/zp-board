package com.dn.common.utils;

import java.text.DecimalFormat;
import java.text.ParsePosition;

public abstract class NumberUtils extends org.springframework.util.NumberUtils {

	/**
	 * String -> Number
	 *
	 * @param number	"1,234,000"
	 * @param format	"#,##0"
	 * @return "1,234,000" -> 1234000
	 */
	public static Number parseNumber(String number, String format) {
		DecimalFormat formatter = new DecimalFormat(format);
		return formatter.parse(number, new ParsePosition(0));
	}

	/**
	 * String -> int
	 *
	 * @param number	"1,234,000"
	 * @param format	"#,##0"
	 * @return "1,234,000" -> 1234000
	 */
	public static int parseInt(String number, String format) {
		return parseNumber(number, format).intValue();
	}

	/**
	 * String -> long
	 *
	 * @param number	"1,234,000"
	 * @param format	"#,##0"
	 * @return "1,234,000" -> 1234000
	 */
	public static long parseLong(String number, String format) {
		return parseNumber(number, format).longValue();
	}

	/**
	 * String -> float
	 *
	 * @param number	"1,234,000"
	 * @param format	"#,##0.0"
	 * @return "1,234,000" -> 1234000.0f
	 */
	public static float parseFloat(String number, String format) {
		return parseNumber(number, format).floatValue();
	}

	/**
	 * String -> double
	 *
	 * @param number	"1,234,000"
	 * @param format	"#,##0.0"
	 * @return "1,234,000" -> 1234000.0d
	 */
	public static double parseDouble(String number, String format) {
		return parseNumber(number, format).doubleValue();
	}

	/**
	 * int -> String
	 *
	 * @param number	1234
	 * @param format	"#,##0"
	 * @return 1234 -> "1,234"
	 */
	public static String formatNumber(int number, String format) {
		DecimalFormat formatter = new DecimalFormat(format);
		return formatter.format(number);
	}

	/**
	 * long -> String
	 *
	 * @param number	1234
	 * @param format	"#,##0"
	 * @return 1234 -> "1,234"
	 */
	public static String formatNumber(long number, String format) {
		DecimalFormat formatter = new DecimalFormat(format);
		return formatter.format(number);
	}

	/**
	 * float -> String
	 *
	 * @param number	1234.0f
	 * @param format	"#,##0"
	 * @return 1234 -> "1,234"
	 */
	public static String formatNumber(float number, String format) {
		DecimalFormat formatter = new DecimalFormat(format);
		return formatter.format(number);
	}

	/**
	 * double -> String
	 *
	 * @param number	1234.0d
	 * @param format	"#,##0"
	 * @return 1234 -> "1,234"
	 */
	public static String formatNumber(double number, String format) {
		DecimalFormat formatter = new DecimalFormat(format);
		return formatter.format(number);
	}

    public static int zero2value(int number, int value) {
    	return number == 0 ? value : number;
    }
}

