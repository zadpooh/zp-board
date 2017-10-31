package com.dn.common.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.MessageDigest;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class StringUtils extends org.springframework.util.StringUtils {


	    /**
	     * <p>
	     * 에러나 이벤트와 관련된 각종 메시지를 로깅하기 위한 Log 오브젝트
	     * </p>
	     */

	    private static Logger logger = LoggerFactory.getLogger(StringUtils.class);

		private final static char WHITE_SPACE = ' ';
		
		public final static String LINE_SEPARATOR = System.getProperty("line.separator");

	    /**
	     * @param str
	     * @return
	     */
	    public static boolean isNull(String str) {

	        if (str != null) {
	        	str = str.trim();
	        }

	        return (str == null || "".equals(str));
	    }

	    /**
	     * @param str
	     * @return
	     */
	    public static boolean isAlpha(String str) {

	        if (str == null) {
	            return false;
	        }

	        int size = str.length();

			if (size == 0)
	            return false;

	        for (int i = 0; i < size; i++) {
	            if (!Character.isLetter(str.charAt(i))) {
	                return false;
	            }
	        }

	        return true;
		}

	    /**
	     * @param str
	     * @return
	     */
	    public static boolean isAlphaNumeric(String str) {

	        if (str == null) {
	            return false;
	        }

	        int size = str.length();

	        if (size == 0)
	            return false;

	        for (int i = 0; i < size; i++) {
	            if (!Character.isLetterOrDigit(str.charAt(i))) {
					return false;
				}
			}

			return true;
		}

	    /**
	     * @param integer
	     * @return
	     */
	    public static String integer2string(int integer) {
			return ("" + integer);
		}
	    
	    /**
	     * @param data
	     * @return
	     */
	    public static String long2string(long longdata) {
			return String.valueOf(longdata);
		}
	    
	    public static String float2string(float floatdata) {
			return String.valueOf(floatdata);
		}
	    
	    public static String double2string(double doubledata) {
			return String.valueOf(doubledata);
		}
	    
	    /**
	     * @param str
	     * @return
	     */
	    public static String null2void(String str) {

	        if (isNull(str)) {
	        	str = "";
	        }

	        return str;
	    }
	    
	    /**
	     * @param str
	     * @return
	     */
	    public static int string2integer(String str) {

	        if (isNull(str)) {
	            return 0;
	        }

	        return Integer.parseInt(str);
	    }
	    
	    /**
	     * @param str
	     * @return
	     */
	    public static float string2float(String str) {
	    	
	        if (isNull(str)) {
	            return 0.0F;
	        }

	        return Float.parseFloat(str);
	    }
	    
	    /**
	     * @param str
	     * @return
	     */
	    public static double string2double(String str) {

	        if (isNull(str)) {
	            return 0.0D;
	        }

	        return Double.parseDouble(str);
	    }
	    
	    /**
	     * @param str
	     * @return
	     */
	    public static long string2long(String str) {

	        if (isNull(str)) {
	            return 0L;
	        }

	        return Long.parseLong(str);
	    }
	    
	    /**
	     * @param str
	     * @param defaultValue
	     * @return
	     */
	    public static String nullToString(String str, String defaultValue) {

	        if (isNull(str)) {
	        	return defaultValue;
	        }

	        return str;
	    }
	    
	    public static String nullToString(String str) {
	        return nullToString(str, "");
	    }
	    
	    
	    /**
	     * @param str
	     * @param defaultValue
	     * @return
	     */
	    public static int string2integer(String str, int defaultValue) {

	        if (isNull(str)) {
	            return defaultValue;
	        }

	        return Integer.parseInt(str);
	    }

	    /**
	     * @param str
	     * @param defaultValue
	     * @return
	     */
	    public static float string2float(String str, float defaultValue) {
	    	
	        if (isNull(str)) {
	            return defaultValue;
	        }

	        return Float.parseFloat(str);
	    }
	    
	    /**
	     * @param str
	     * @param defaultValue
	     * @return
	     */
	    public static double string2double(String str, double defaultValue) {

	        if (isNull(str)) {
	            return defaultValue;
	        }

	        return Double.parseDouble(str);
	    }
	    
	    /**
	     * @param str
	     * @param defaultValue
	     * @return
	     */
	    public static long string2long(String str, long defaultValue) {

	        if (isNull(str)) {
	            return defaultValue;
	        }

	        return Long.parseLong(str);
	    }
	    
		
	    /**
	     * @param source
	     * @param target
	     * @return
	     */
	    public static boolean equals(String source, String target) {

	        return null2void(source).equals(null2void(target));

	    }
		
	    /**
	     * @param str
	     * @param beginIndex
	     * @param endIndex
	     * @return
	     */
	    public static String toSubString(String str, int beginIndex, int endIndex) {

	        if (equals(str, "")) {
	            return str;
	        } else if (str.length() < beginIndex) {
	            return "";
	        } else if (str.length() < endIndex) {
	            return str.substring(beginIndex);
	        } else {
	            return str.substring(beginIndex, endIndex);
	        }

	    }
		
	    /**
	     * @param source
	     * @param beginIndex
	     * @return
	     */
	    public static String toSubString(String source, int beginIndex) {

	        if (equals(source, "")) {
	            return source;
	        } else if (source.length() < beginIndex) {
	            return "";
	        } else {
	            return source.substring(beginIndex);
	        }

	    }

	    /**
	     * @param source
	     * @param target
	     * @return
	     */
	    public static int search(String source, String target) {
	        int result = 0;
	        String strCheck = new String(source);
	        for (int i = 0; i < source.length();) {
	            int loc = strCheck.indexOf(target);
	            if (loc == -1) {
	                break;
	            } else {
	                result++;
	                i = loc + target.length();
	                strCheck = strCheck.substring(i);
	            }
	        }
	        return result;
	    }


	    /**
	     * @param str
	     * @return
	     */
	    public static String trim(String str) {
	        return str.trim();
		}

	    /**
	     * @param str
	     * @return
	     */
	    public static String ltrim(String str) {

	        int index = 0;

	        while (' ' == str.charAt(index++));

	        if (index > 0)
	        	str = str.substring(index - 1);

	        return str;
		}

	    public static String rtrim(String str) {

	        int index = str.length();

	        while (' ' == str.charAt(--index));

	        if (index < str.length())
	        	str = str.substring(0, index + 1);

	        return str;
		}

	    public static String concat(String str1, String str2) {

	    	StringBuffer sb = new StringBuffer(str1);
	    	sb.append(str2);

	        return sb.toString();
		}
	    
	    public static String lPad(String str, int len, char pad) {
	        return lPad(str, len, pad, false);
	    }

	    public static String lPad(String str, int len, char pad, boolean isTrim) {

	        if (isNull(str)) {
	            return null;
	        }

	        if (isTrim) {
	        	str = str.trim();
	        }

	        for (int i = str.length(); i < len; i++) {
	        	str = pad + str;
	        }

	        return str;
	    }
	    
	    public static String rPad(String str, int len, char pad) {
	        return rPad(str, len, pad, false);
	    }
	    
	    public static String rPad(String str, int len, char pad, boolean isTrim) {

	        if (isNull(str)) {
	            return null;
	        }

	        if (isTrim) {
	        	str = str.trim();
	        }

	        for (int i = str.length(); i < len; i++) {
	        	str = str + pad;
	        }

	        return str;
	    }
	    
	    public static String alignLeft(String str, int length) {
	        return alignLeft(str, length, false);
	    }
	    
	    /**
	     * @param str
	     * @param length
	     * @param isEllipsis
	     * @return
	     */
	    public static String alignLeft(String str, int length, boolean isEllipsis) {

	        if (str.length() <= length) {

	            StringBuffer temp = new StringBuffer(str);
	            for (int i = 0; i < (length - str.length()); i++) {
	                temp.append(WHITE_SPACE);
	            }
	            return temp.toString();
	        } else {
	            if (isEllipsis) {

	                StringBuffer temp = new StringBuffer(length);
	                temp.append(str.substring(0, length - 3));
	                temp.append("...");

	                return temp.toString();
	            } else {
	                return str.substring(0, length);
	            }
	        }
	    }
	    
	    public static String alignRight(String str, int length) {

	        return alignRight(str, length, false);
	    }
	    
	    public static String alignRight(String str, int length, boolean isEllipsis) {

	        if (str.length() <= length) {

	            StringBuffer temp = new StringBuffer(length);
	            for (int i = 0; i < (length - str.length()); i++) {
	                temp.append(WHITE_SPACE);
	            }
	            temp.append(str);
	            return temp.toString();
	        } else {
	            if (isEllipsis) {

	                StringBuffer temp = new StringBuffer(length);
	                temp.append(str.substring(0, length - 3));
	                temp.append("...");
	                return temp.toString();
	            } else {
	                return str.substring(0, length);
	            }
	        }
	    }
	    
	    public static String alignCenter(String str, int length) {
	        return alignCenter(str, length, false);
	    }
	    
	    public static String alignCenter(String str, int length, boolean isEllipsis) {
	        if (str.length() <= length) {

	            StringBuffer temp = new StringBuffer(length);
	            int leftMargin = (int) (length - str.length()) / 2;

	            int rightMargin;
	            if ((leftMargin * 2) == (length - str.length())) {
	                rightMargin = leftMargin;
	            } else {
	                rightMargin = leftMargin + 1;
	            }

	            for (int i = 0; i < leftMargin; i++) {
	                temp.append(WHITE_SPACE);
	            }

	            temp.append(str);

	            for (int i = 0; i < rightMargin; i++) {
	                temp.append(WHITE_SPACE);
	            }

	            return temp.toString();
	        } else {
	            if (isEllipsis) {

	                StringBuffer temp = new StringBuffer(length);
	                temp.append(str.substring(0, length - 3));
	                temp.append("...");
	                return temp.toString();
	            } else {
	                return str.substring(0, length);
	            }
	        }

	    }

	    public static String capitalize(String str) {
	        return !isNull(str) ? str.substring(0, 1).toUpperCase() + str.substring(1).toLowerCase() : str;
	    }
	    
	    /**
	     * @param str
	     * @param pattern
	     * @return
	     * @throws Exception
	     */
	    public static boolean isPatternMatch(String str, String pattern) throws Exception {
	    	Matcher matcher = Pattern.compile(pattern).matcher(str);
	    	logger.debug("" + matcher);

	    	return matcher.matches();
		}

	    public static String toEng (String kor) throws UnsupportedEncodingException  {
	        
	    	if (isNull(kor)) {
	            return null;
	        }

	        return new String(kor.getBytes("KSC5601"),"8859_1");

	    }

	    public static String toKor (String en) throws UnsupportedEncodingException {

	        if (isNull(en)) {
	            return null;
	        }

	        return new String (en.getBytes("8859_1"), "euc-kr");
	    }
	    
	    public static int countOf(String str, String charToFind) {
			int findLength = charToFind.length();
			int count = 0;

			for (int idx = str.indexOf(charToFind); idx >=0; idx = str.indexOf(charToFind, idx + findLength)) {
				count++;
			}

	    	return count;
		}
	/*
	 * StringUtil in Anyframe
	 */

		/**
		 * Encode a string using algorithm specified in web.xml and return the
		 * resulting encrypted password. If exception, the plain credentials string
		 * is returned
		 * 
		 * @param password
		 *            Password or other credentials to use in authenticating this
		 *            username
		 * @param algorithm
		 *            Algorithm used to do the digest
		 * @return encypted password based on the algorithm.
		 */
		public static String encodePassword(String password, String algorithm) {
			byte[] unencodedPassword = password.getBytes();

			MessageDigest md = null;

			try {
				// first create an instance, given the provider
				md = MessageDigest.getInstance(algorithm);
			} catch (Exception e) {
				logger.error("Exception: {}" , e);

				return password;
			}

			md.reset();

			// call the update method one or more times
			// (useful when you don't know the size of your data, eg. stream)
			md.update(unencodedPassword);

			// now calculate the hash
			byte[] encodedPassword = md.digest();

			StringBuffer buf = new StringBuffer();

			for (int i = 0; i < encodedPassword.length; i++) {
				if (((int) encodedPassword[i] & 0xff) < 0x10) {
					buf.append("0");
				}

				buf.append(Long.toString((int) encodedPassword[i] & 0xff, 16));
			}

			return buf.toString();
		}

		
		/**
		 * convert first letter to a big letter or a small letter.<br>
		 * 
		 * <pre>
		 * StringUtil.trim('Password') = 'password'
		 * StringUtil.trim('password') = 'Password'
		 * </pre>
		 * 
		 * @param str
		 *            String to be swapped
		 * @return String converting result
		 */
		public static String swapFirstLetterCase(String str) {
			StringBuffer sbuf = new StringBuffer(str);
			sbuf.deleteCharAt(0);
			if (Character.isLowerCase(str.substring(0, 1).toCharArray()[0])) {
				sbuf.insert(0, str.substring(0, 1).toUpperCase());
			} else {
				sbuf.insert(0, str.substring(0, 1).toLowerCase());
			}
			return sbuf.toString();
		}

		/**
		 * If original String has a specific String, remove specific Strings from
		 * original String.
		 * 
		 * <pre>
		 * StringUtil.trim('pass*word', '*') = 'password'
		 * </pre>
		 * 
		 * @param origString
		 *            original String
		 * @param trimString
		 *            String to be trimmed
		 * @return converting result
		 */
		public static String trim(String origString, String trimString) {
			int startPosit = origString.indexOf(trimString);
			if (startPosit != -1) {
				int endPosit = trimString.length() + startPosit;
				return origString.substring(0, startPosit)
						+ origString.substring(endPosit);
			}
			return origString;
		}

		/**
		 * Break a string into specific tokens and return a String of last location.
		 * 
		 * <pre>
		 * StringUtil.getLastString('password*password*a*b*c', '*') = 'c'
		 * </pre>
		 * 
		 * @param origStr
		 *            original String
		 * @param strToken
		 *            specific tokens
		 * @return String of last location
		 */
		public static String getLastString(String origStr, String strToken) {
			StringTokenizer str = new StringTokenizer(origStr, strToken);
			String lastStr = "";
			while (str.hasMoreTokens()) {
				lastStr = str.nextToken();
			}
			return lastStr;
		}

		/**
		 * If original String has token, Break a string into specific tokens and
		 * change String Array. If not, return a String Array which has original
		 * String as it is.
		 * 
		 * <pre>
		 * StringUtil.getStringArray('passwordabcpassword', 'abc') 		= String[]{'password','password'}
		 * StringUtil.getStringArray('pasword*password', 'abc') 		= String[]{'pasword*password'}
		 * </pre>
		 * 
		 * @param str
		 *            original String
		 * @param strToken
		 *            specific String token
		 * @return String[]
		 */
		public static String[] getStringArray(String str, String strToken) {
			if (str == null) {
				return null;
			}
			if (str.indexOf(strToken) != -1) {
				StringTokenizer st = new StringTokenizer(str, strToken);
				String[] stringArray = new String[st.countTokens()];
				for (int i = 0; st.hasMoreTokens(); i++) {
					stringArray[i] = st.nextToken();
				}
				return stringArray;
			}
			return new String[] { str };
		}

		/**
		 * If string is null or empty string, return false. <br>
		 * If not, return true.
		 * 
		 * <pre>
		 * StringUtil.isNotEmpty('') 		= false
		 * StringUtil.isNotEmpty(null) 		= false
		 * StringUtil.isNotEmpty('abc') 	= true
		 * </pre>
		 * 
		 * @param str
		 *            original String
		 * @return which empty string or not.
		 */
		public static boolean isNotEmpty(String str) {
			return !isEmpty(str);
		}

		/**
		 * If string is null or empty string, return true. <br>
		 * If not, return false.
		 * 
		 * <pre>
		 * StringUtil.isEmpty('') 		= true
		 * StringUtil.isEmpty(null) 	= true
		 * StringUtil.isEmpty('abc') 	= false
		 * </pre>
		 * 
		 * @param str
		 *            original String
		 * @return which empty string or not.
		 */
		public static boolean isEmpty(String str) {
			return (str == null || str.length() == 0);
		}

		/**
		 * replace replaced string to specific string from original string. <br>
		 * 
		 * <pre>
		 * StringUtil.replace('work$id', '$', '.') 	= 'work.id'
		 * </pre>
		 * 
		 * @param str
		 *            original String
		 * @param replacedStr
		 *            to be replaced String
		 * @param replaceStr
		 *            replace String
		 * @return converting result
		 */
		public static String replace(String str, String replacedStr,
				String replaceStr) {
			String newStr = "";
			if (str.indexOf(replacedStr) != -1) {
				String s1 = str.substring(0, str.indexOf(replacedStr));
				String s2 = str.substring(str.indexOf(replacedStr) + 1);
				newStr = s1 + replaceStr + s2;
			}
			return newStr;
		}

		/**
		 * It converts the string representation of a number to integer type (eg.
		 * '27' -> 27)
		 * 
		 * <pre>
		 * StringUtil.string2integer('14') 	= 14
		 * </pre>
		 * 
		 * @param str
		 *            string representation of a number
		 * @return integer integer type of string
		 *
		public static int string2integer(String str) {
			int ret = Integer.parseInt(str.trim());

			return ret;
		}

		/**
		 * It converts integer type to String ( 27 -> '27')
		 * 
		 * <pre>
		 * StringUtil.integer2string(14) 	= '14'
		 * </pre>
		 * 
		 * @param integer
		 *            integer type
		 * @return String string representation of a number
		 *
		public static String integer2string(int integer) {
			return ("" + integer);
		}

		/**
		 * It returns true if str matches the pattern string. It performs regular
		 * expression pattern matching.
		 * 
		 * <pre>
		 * StringUtil.isPatternMatching('abc-def', '*-*') 	= true
		 * StringUtil.isPatternMatching('abc', '*-*') 	= false
		 * </pre>
		 * 
		 * @param str
		 *            original String
		 * @param pattern
		 *            pattern String
		 * @return boolean which matches the pattern string or not.
		 * @throws Exception
		 *             fail to check pattern matched
		 */
		public static boolean isPatternMatching(String str, String pattern)
				throws Exception {
			// if url has wild key, i.e. "*", convert it to ".*" so that we can
			// perform regex matching
			if (pattern.indexOf('*') >= 0) {
				pattern = pattern.replaceAll("\\*", ".*");
			}

			pattern = "^" + pattern + "$";

			return Pattern.matches(pattern, str);
		}

		/**
		 * It returns true if string contains a sequence of the same character.
		 * 
		 * <pre>
		 * StringUtil.containsMaxSequence('password', '2') 	= true
		 * StringUtil.containsMaxSequence('my000', '3') 	= true
		 * StringUtil.containsMaxSequence('abbbbc', '5')	= false
		 * </pre>
		 * 
		 * @param str
		 *            original String
		 * @param maxSeqNumber
		 *            a sequence of the same character
		 * @return which contains a sequence of the same character
		 */
		public static boolean containsMaxSequence(String str, String maxSeqNumber) {
			int occurence = 1;
			int max = string2integer(maxSeqNumber);
			if (str == null) {
				return false;
			}

			int sz = str.length();
			for (int i = 0; i < (sz - 1); i++) {
				if (str.charAt(i) == str.charAt(i + 1)) {
					occurence++;

					if (occurence == max)
						return true;
				} else {
					occurence = 1;
				}
			}
			return false;
		}

		/**
		 * <p>
		 * Checks that the String contains certain characters.
		 * </p>
		 * <p>
		 * A <code>null</code> String will return <code>false</code>. A
		 * <code>null</code> invalid character array will return
		 * <code>false</code>. An empty String ("") always returns false.
		 * </p>
		 * 
		 * <pre>
		 * StringUtil.containsInvalidChars(null, *)       			= false
		 * StringUtil.containsInvalidChars(*, null)      			= false
		 * StringUtil.containsInvalidChars(&quot;&quot;, *)         = false
		 * StringUtil.containsInvalidChars(&quot;ab&quot;, '')      = false
		 * StringUtil.containsInvalidChars(&quot;abab&quot;, 'xyz') = false
		 * StringUtil.containsInvalidChars(&quot;ab1&quot;, 'xyz')  = false
		 * StringUtil.containsInvalidChars(&quot;xbz&quot;, 'xyz')  = true
		 * </pre>
		 * 
		 * @param str
		 *            the String to check, may be null
		 * @param invalidChars
		 *            an array of invalid chars, may be null
		 * @return false if it contains none of the invalid chars, or is null
		 */

		public static boolean containsInvalidChars(String str, char[] invalidChars) {
			if (str == null || invalidChars == null) {
				return false;
			}
			int strSize = str.length();
			int validSize = invalidChars.length;
			for (int i = 0; i < strSize; i++) {
				char ch = str.charAt(i);
				for (int j = 0; j < validSize; j++) {
					if (invalidChars[j] == ch) {
						return true;
					}
				}
			}
			return false;
		}

		/**
		 * <p>
		 * Checks that the String contains certain characters.
		 * </p>
		 * <p>
		 * A <code>null</code> String will return <code>false</code>. A
		 * <code>null</code> invalid character array will return
		 * <code>false</code>. An empty String ("") always returns false.
		 * </p>
		 * 
		 * <pre>
		 * StringUtil.containsInvalidChars(null, *)       			= false
		 * StringUtil.containsInvalidChars(*, null)      			= false
		 * StringUtil.containsInvalidChars(&quot;&quot;, *)         = false
		 * StringUtil.containsInvalidChars(&quot;ab&quot;, '')      = false
		 * StringUtil.containsInvalidChars(&quot;abab&quot;, 'xyz') = false
		 * StringUtil.containsInvalidChars(&quot;ab1&quot;, 'xyz')  = false
		 * StringUtil.containsInvalidChars(&quot;xbz&quot;, 'xyz')  = true
		 * </pre>
		 * 
		 * @param str
		 *            the String to check, may be null
		 * @param invalidChars
		 *            a String of invalid chars, may be null
		 * @return false if it contains none of the invalid chars, or is null
		 */
		public static boolean containsInvalidChars(String str, String invalidChars) {
			if (str == null || invalidChars == null) {
				return true;
			}
			return containsInvalidChars(str, invalidChars.toCharArray());
		}

		/**
		 * <p>
		 * Checks if the String contains only unicode letters or digits.
		 * </p>
		 * <p>
		 * <code>null</code> will return <code>false</code>. An empty String
		 * ("") will return <code>false</code>.
		 * </p>
		 * 
		 * <pre>
		 * StringUtil.isAlphaNumeric(null)   			 = false
		 * StringUtil.isAlphaNumeric(&quot;&quot;)     = false
		 * StringUtil.isAlphaNumeric(&quot;  &quot;)   = false
		 * StringUtil.isAlphaNumeric(&quot;abc&quot;)  = true
		 * StringUtil.isAlphaNumeric(&quot;ab c&quot;) = false
		 * StringUtil.isAlphaNumeric(&quot;ab2c&quot;) = true
		 * StringUtil.isAlphaNumeric(&quot;ab-c&quot;) = false
		 * </pre>
		 * 
		 * @param str
		 *            the String to check, may be null
		 * @return <code>true</code> if only contains letters or digits, and is
		 *         non-null
		 *
		public static boolean isAlphaNumeric(String str) {
			if (str == null) {
				return false;
			}
			int sz = str.length();
			if (sz == 0)
				return false;
			for (int i = 0; i < sz; i++) {
				if (!Character.isLetterOrDigit(str.charAt(i))) {
					return false;
				}
			}
			return true;
		}

		/**
		 * <p>
		 * Checks if the String contains only unicode letters.
		 * </p>
		 * <p>
		 * <code>null</code> will return <code>false</code>. An empty String
		 * ("") will return <code>false</code>.
		 * </p>
		 * 
		 * <pre>
		 * StringUtil.isAlpha(null)   			= false
		 * StringUtil.isAlpha(&quot;&quot;)     = false
		 * StringUtil.isAlpha(&quot;  &quot;)   = false
		 * StringUtil.isAlpha(&quot;abc&quot;)  = true
		 * StringUtil.isAlpha(&quot;ab2c&quot;) = false
		 * StringUtil.isAlpha(&quot;ab-c&quot;) = false
		 * </pre>
		 * 
		 * @param str
		 *            the String to check, may be null
		 * @return <code>true</code> if only contains letters, and is non-null
		 *
		public static boolean isAlpha(String str) {
			if (str == null) {
				return false;
			}
			int sz = str.length();
			if (sz == 0)
				return false;
			for (int i = 0; i < sz; i++) {
				if (!Character.isLetter(str.charAt(i))) {
					return false;
				}
			}
			return true;
		}

		/**
		 * <p>
		 * Checks if the String contains only unicode digits. A decimal point is not
		 * a unicode digit and returns false.
		 * </p>
		 * <p>
		 * <code>null</code> will return <code>false</code>. An empty String
		 * ("") will return <code>false</code>.
		 * </p>
		 * 
		 * <pre>
		 * StringUtil.isNumeric(null)   		   = false
		 * StringUtil.isNumeric(&quot;&quot;)     = false
		 * StringUtil.isNumeric(&quot;  &quot;)   = false
		 * StringUtil.isNumeric(&quot;123&quot;)  = true
		 * StringUtil.isNumeric(&quot;12 3&quot;) = false
		 * StringUtil.isNumeric(&quot;ab2c&quot;) = false
		 * StringUtil.isNumeric(&quot;12-3&quot;) = false
		 * StringUtil.isNumeric(&quot;12.3&quot;) = false
		 * </pre>
		 * 
		 * @param str
		 *            the String to check, may be null
		 * @return <code>true</code> if only contains digits, and is non-null
		 */
		public static boolean isNumeric(String str) {
			if (str == null) {
				return false;
			}
			int sz = str.length();
			if (sz == 0)
				return false;
			for (int i = 0; i < sz; i++) {
				if (!Character.isDigit(str.charAt(i))) {
					return false;
				}
			}
			return true;
		}

		/**
		 * <p>
		 * Reverses a String as per {@link StringBuffer#reverse()}.
		 * </p>
		 * <p>
		 * <A code>null</code> String returns <code>null</code>.
		 * </p>
		 * 
		 * <pre>
		 * StringUtil.reverse(null)  		   = null
		 * StringUtil.reverse(&quot;&quot;)    = &quot;&quot;
		 * StringUtil.reverse(&quot;bat&quot;) = &quot;tab&quot;
		 * </pre>
		 * 
		 * @param str
		 *            the String to reverse, may be null
		 * @return the reversed String, <code>null</code> if null String input
		 */

		public static String reverse(String str) {
			if (str == null) {
				return null;
			}
			return new StringBuffer(str).reverse().toString();
		}

		/**
		 * Make a new String that filled original to a special char as cipers
		 * 
		 * @param originalStr
		 *            original String
		 * @param ch
		 *            a special char
		 * @param cipers
		 *            cipers
		 * @return filled String
		 */
		public static String fillString(String originalStr, char ch, int cipers) {
			int originalStrLength = originalStr.length();

			if (cipers < originalStrLength)
				return null;

			int difference = cipers - originalStrLength;

			StringBuffer strBuf = new StringBuffer();
			for (int i = 0; i < difference; i++)
				strBuf.append(ch);

			strBuf.append(originalStr);
			return strBuf.toString();
		}

		/**
		 * Determine whether a (trimmed) string is empty
		 * 
		 * @param foo
		 *            The text to check.
		 * @return Whether empty.
		 */
		public static final boolean isEmptyTrimmed(String foo) {
			return (foo == null || foo.trim().length() == 0);
		}


		/**
		 * UUID를 이용한 랜덤 스트링
		 * @return
		 */
		public static String getToken() {
			return UUID.randomUUID().toString();
		}
		/**
		 * Return token list
		 * 
		 * @param lst
		 * @param separator
		 * @return
		 */
		public static List getTokens(String lst, String separator) {
			List tokens = new ArrayList();

			if (lst != null) {
				StringTokenizer st = new StringTokenizer(lst, separator);
				while (st.hasMoreTokens()) {
					try {
						String en = st.nextToken().trim();
						tokens.add(en);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}

			return tokens;
		}

		/**
		 * Return token list which is separated by ","
		 * 
		 * @param lst
		 * @return
		 */
		public static List getTokens(String lst) {
			return getTokens(lst, ",");
		}
		
		/**
		 * 언더바(_), 하이픈(-) 기준으로 카멜 케이스 패턴으로 변환한다.
		 * @param str
		 * @return
		 */
		public static String convertToCamel(String str) {
			Pattern p = Pattern.compile("[_-](.)");
		    Matcher m = p.matcher(str.toLowerCase());
		    StringBuffer sb = new StringBuffer();
		    while (m.find()) {
		        m.appendReplacement(sb, m.group(1).toUpperCase());
		    }
		    m.appendTail(sb);
		    return sb.toString();
		}
		
		
		

		/**
		 * This method convert "string_util" to "stringUtil"
		 * 
		 * @param String
		 *            targetString
		 * 
		 * @param char
		 *            posChar
		 * 
		 * @return String result
		 */
		public static String convertToCamelCase(String targetString, char posChar) {
			StringBuffer result = new StringBuffer();
			boolean nextUpper = false;
			String allLower = targetString.toLowerCase();
			
			for (int i = 0; i < allLower.length(); i++) {
				char currentChar = allLower.charAt(i);
				if (currentChar == posChar) {
					nextUpper = true;
				} else {
					if (nextUpper) {
						currentChar = Character.toUpperCase(currentChar);
						nextUpper = false;
					}
					result.append(currentChar);
				}
			}
			return result.toString();
		}
		
		

		/**
		 * Convert a string that may contain underscores to camel case.
		 * 
		 * @param underScore
		 *            Underscore name.
		 * @return Camel case representation of the underscore string.
		 */
		public static String convertToCamelCase(String underScore) {
			return convertToCamelCase(underScore, '_');
		}

		/**
		 * Convert a camel case string to underscore representation.
		 * 
		 * @param camelCase
		 *            Camel case name.
		 * @return Underscore representation of the camel case string.
		 */
		public static String convertToUnderScore(String camelCase) {
			String result = "";
			for (int i = 0; i < camelCase.length(); i++) {
				char currentChar = camelCase.charAt(i);
				// This is starting at 1 so the result does not end up with an
				// underscore at the begin of the value
				if (i > 0 && Character.isUpperCase(currentChar)) {
					result = result.concat("_");
				}
				result = result.concat(Character.toString(currentChar)
						.toLowerCase());
			}
			return result;
		}
		
		
		
		public static String nl2br(String comment) {
			return comment.replaceAll("\n", "<br />");
		} 

		
		/**
	     * <p>문자열 내부의 마이너스 character(-)를 모두 제거한다.</p>
	     *
	     * <pre>
	     * StringUtil.removeMinusChar(null)       = null
	     * StringUtil.removeMinusChar("")         = ""
	     * StringUtil.removeMinusChar("a-sdfg-qweqe") = "asdfgqweqe"
	     * </pre>
	     *
	     * @param str  입력받는 기준 문자열
	     * @return " - "가 제거된 입력문자열
	     *  입력문자열이 null인 경우 출력문자열은 null
	     */
	    public static String removeMinusChar(String str) {
	        return remove(str, '-');
	    }
	    
	    
	    
	    /**
	     * <p>기준 문자열에 포함된 모든 대상 문자(char)를 제거한다.</p>
	     *
	     * <pre>
	     * StringUtil.remove(null, *)       = null
	     * StringUtil.remove("", *)         = ""
	     * StringUtil.remove("queued", 'u') = "qeed"
	     * StringUtil.remove("queued", 'z') = "queued"
	     * </pre>
	     *
	     * @param str  입력받는 기준 문자열
	     * @param remove  입력받는 문자열에서 제거할 대상 문자열
	     * @return 제거대상 문자열이 제거된 입력문자열. 입력문자열이 null인 경우 출력문자열은 null
	     */
	    public static String remove(String str, char remove) {
	        if (isEmpty(str) || str.indexOf(remove) == -1) {
	            return str;
	        }
	        char[] chars = str.toCharArray();
	        int pos = 0;
	        for (int i = 0; i < chars.length; i++) {
	            if (chars[i] != remove) {
	                chars[pos++] = chars[i];
	            }
	        }
	        return new String(chars, 0, pos);
	    }
	    
	    public static String substr(String str, Integer startIdx, Integer cnt)
	    {
	        if ( str == null ) return str;

	        int strLen = str.length();
	        
	        if ( startIdx < 0 ) startIdx = 0;
	        if ( startIdx > strLen ) startIdx = strLen;
	        
	        if ( cnt < 0 ) cnt = 0;
	        
	        int endIdx = startIdx + cnt;
	        
	        if ( endIdx > strLen ) endIdx = strLen;
	        
	        return str.substring(startIdx, endIdx);
	    }
	    
	    public static String substr(String str, int cnt, String suffix){
	        if ( str == null ) return str;
	        if (suffix==null) suffix = "";
	        

	        if (str.length() > cnt) {
	            str = substr(str, 0, cnt);
	        	str = str + suffix;
	        } 
	        return str;
	    }
	    
	    /**
	     * 말 줄임 처리
	     * @param str
	     * @param cnt
	     * @return
	     */
	    public static String strcut(String str, Integer cnt) {
	        if ( str == null ) return str;
	        str = substr(str, cnt, "...");
	        return str;
	    }
	    
	    /**
	     * Html Tag를 없앤다.
	     * @param str
	     * @return
	     */
	    public static String stripTags(String str) {
			return str.replaceAll("<(/)?([a-zA-Z1-9]*)(\\s[a-zA-Z1-9]*=[^>]*)?(\\s)*(/)?>", "");
		}
	    
	    public static String profileImage(String str) {
	    	return str == null || str == "/content/img/com/ico-people.png" ? "" : str ;
	    }
	    
	    /**
	     * XSS방지를 위해 script 태그를 삭제한다.
	     * @param tag
	     * @return
	     */
	    public static String stripScriptTag(String tag) {
			return tag.replaceAll("<(no)?[sS][cC][rR][iI][pP][tT][^>]*>.*?</(no)?[sS][cC][rR][iI][pP][tT]>", "");
		}
	    
	    
	    
	    public static String stripXSS(String value) {
	        if (value != null) {
	            // NOTE: It's highly recommended to use the ESAPI library and uncomment the following line to
	            // avoid encoded attacks.
	            // value = ESAPI.encoder().canonicalize(value);

	            // Avoid null characters
	            value = value.replaceAll("", "");

	            // Avoid anything between script tags
	            Pattern scriptPattern = Pattern.compile("<script>(.*?)</script>", Pattern.CASE_INSENSITIVE);
	            value = scriptPattern.matcher(value).replaceAll("");

	            // Avoid anything in a src='...' type of expression
	            scriptPattern = Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?)\\\'", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
	            value = scriptPattern.matcher(value).replaceAll("");

	            scriptPattern = Pattern.compile("src[\r\n]*=[\r\n]*\\\"(.*?)\\\"", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
	            value = scriptPattern.matcher(value).replaceAll("");

	            // Remove any lonesome </script> tag
	            scriptPattern = Pattern.compile("</script>", Pattern.CASE_INSENSITIVE);
	            value = scriptPattern.matcher(value).replaceAll("");

	            // Remove any lonesome <script ...> tag
	            scriptPattern = Pattern.compile("<script(.*?)>", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
	            value = scriptPattern.matcher(value).replaceAll("");

	            // Avoid eval(...) expressions
	            scriptPattern = Pattern.compile("eval\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
	            value = scriptPattern.matcher(value).replaceAll("");

	            // Avoid expression(...) expressions
	            scriptPattern = Pattern.compile("expression\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
	            value = scriptPattern.matcher(value).replaceAll("");

	            // Avoid javascript:... expressions
	            scriptPattern = Pattern.compile("javascript:", Pattern.CASE_INSENSITIVE);
	            value = scriptPattern.matcher(value).replaceAll("");

	            // Avoid vbscript:... expressions
	            scriptPattern = Pattern.compile("vbscript:", Pattern.CASE_INSENSITIVE);
	            value = scriptPattern.matcher(value).replaceAll("");

	            // Avoid onload= expressions
	            scriptPattern = Pattern.compile("onload(.*?)=", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
	            value = scriptPattern.matcher(value).replaceAll("");
	            
	            
	            // KB사회공헌에서는 모든 HTML 스크립트를 삭제 한다.
	            value = value.replaceAll("<(/)?([a-zA-Z1-9]*)(\\s[a-zA-Z1-9]*=[^>]*)?(\\s)*(/)?>", "");
	            
	            value = value.replaceAll("<", "&lt;");
	            value = value.replaceAll(">", "&gt;");
	            value = value.replaceAll("\"", "&quot;");
	            value = value.replaceAll("'", "&#39;");

	            
	            
	        }
	        return value;
	    }
	    
	    
	    public static String[] splitWithoutSpace (String str, String regex) {
			String[] newTags = null;
			if (ValidationUtils.isNotNull(str)) {
				String[] tags = str.split(regex);
				//System.out.println("length = " + tags.length);
					
				int spaceCount = 0;
				
				for (int j = 0; j < tags.length; j++) {
					String tag = tags[j].trim().replaceAll("\\s",  "");
					
					if (tag.equals("")) {
						spaceCount++;
					}
				}
				
				newTags = new String[tags.length - spaceCount];
				
				int index = 0;
				for (int j = 0; j < tags.length; j++) {
					String tag = tags[j].trim().replaceAll("\\s",  "");
					
					if (!tag.equals("")) {
						newTags[index] = tags[j].trim();
						index++;
					}
				}
			}
			
			return newTags;
		}
	    
	    
	    public static String splitWithoutSpaceToString (String str, String regex) {
			String[] result = splitWithoutSpace(str, regex);
			return nullToString(join(result, ","), "");
		}
	    
	    
	    public static String join(String[] s, String glue) { 
			int k=s.length; 
			if (k==0) 
		    return null; 
			StringBuilder out=new StringBuilder(); 
			out.append(s[0]); 
			for (int x=1;x<k;++x) 
				out.append(glue).append(s[x]); 
			return out.toString(); 
		}
	    
	    
	    public static void main(String[] args){
	    	
	    	String a = "1.00";
	    	Float f = Float.parseFloat(a);
	    	System.out.println(f);
	    	
	    	if (f.toString().endsWith(".0"))
	    	      System.out.println(f.intValue()); 
	    	  else
	    		  System.out.println(f.toString());
	    	System.exit(0);
	    	
	    	int i = Integer.parseInt(a);
	    	 String valToStore = (i == f) ? String.valueOf(i) : String.valueOf(f);
	    	 System.out.println(valToStore);
	    	 
	    	  int b = (int)Float.parseFloat(a);
	    	  System.out.println(b);
	    	  
	    	//String a = "1.0";
	    	System.out.println(Integer.parseInt(a));
	    	System.out.println(intFormat(a));
	    	System.out.println(phoneNumberPattern(a));
	    	
	    	
	    	String txt = "abc``abc``";
	    	
	    	System.out.println(replaceComma(txt));
	    }
	    
	    
	    /**
	     * 주민번호 패턴으로 리턴
	     * <pre>
	     * ssnPattern("7807061221212") -> 780706-1221212
	     * </pre>
	     * @param ssn
	     * @return
	     */
	    public static String ssnPattern(String ssn){
	    	if (ssn.length() != 13) return ssn;
	    	return ssn.substring(0, 6) + "-*******";
	    }
	    
	    /**
	     * 전화번호 패턴으로 리턴
	     * <pre>
	     * phoneNumberPattern("0101231234") -> 010-123-1234
	     * phoneNumberPattern("01012341234") -> 010-1234-1234
	     * phoneNumberPattern("050512341234") -> 010-1234-1234
	     * </pre>
	     * @param phoneNumber
	     * @return
	     */
	    public static String phoneNumberPattern(String phoneNumber) {
	    	if (phoneNumber.length() == 10) {
	    		return phoneNumber.substring(0,3) + "-" + phoneNumber.substring(3,6) + "-" +phoneNumber.substring(6,10);
	    	} else if (phoneNumber.length() == 11) {
	    		return phoneNumber.substring(0,3) + "-" + phoneNumber.substring(3,7) + "-" +phoneNumber.substring(7,11);
	    	} else if (phoneNumber.length() == 12) {
	    		return phoneNumber.substring(0,4) + "-" + phoneNumber.substring(4,8) + "-" +phoneNumber.substring(8,12);
	    	} else {
	    		return phoneNumber;
	    	}
	    }
	    
	    
	    public static String numberFormat(Object number) {
			NumberFormat nf = NumberFormat.getNumberInstance();
			return nf.format(number);
		}
		
		public static String numberFormat(String number) {
			if (ValidationUtils.isEmpty(number)) {
				return number;
			}
			NumberFormat nf = NumberFormat.getNumberInstance();
			return nf.format(Double.parseDouble(number));
		}
		
		public static String intFormat(String number) {
			if (number == null || number.trim().equals("")) {
				return "0";
			}

	    	Float f = Float.parseFloat(number);

	    	
	    	if (f.toString().endsWith(".0")) {
	    	      return Integer.toString(f.intValue()); 
	    	} else {
	    		
	    		return f.toString();
	    	}
		}
		
		
		
		public static HashMap<String, Object> paramToMap(String url) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			if (url.indexOf("?") > -1) {
				String parameters = url.substring(url.indexOf("?")+1, url.length());
				
				
				if (parameters.indexOf("&") > -1) {
					String[] params = parameters.split("&");
					//HashMap<String, Object> map = new HashMap<String, Object>();
					

					for (int i = 0; i < params.length; i++) {

						//System.out.println("==========================");
						//System.out.println(params[i]);
						//System.out.println("==========================");					
						
						String[] param = params[i].split("=");
						String key = param[0];
						String value = "";
						if (param.length > 1) {
							try {
								value = URLDecoder.decode((String) param[1], "UTF-8");
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
						
						if (key.equals("itemsPerPage") || key.equals("page")) {
							int itemsPerPage = Integer.parseInt(value);
							map.put(key, itemsPerPage);
						} else {
							map.put(key, value);
						}
						

						//System.out.println(key+" = "+ value);
					}
				}
			}
			
			return map;
		}
		
		public static String randomString(){
			return RandomStringUtils.randomAlphanumeric(20).toUpperCase();
		}
		
		public static String replaceComma(String text) {
			return text.replaceAll("`", ",");
		}
		
		
		/**
		 * 정규식 replaceAll
		 * @param string
		 * @param pattern
		 * @param replacement
		 * @return
		 */
		public static String replaceAll(String string, String pattern, String replacement) {
	         return string.replaceAll(pattern, replacement);
	    }

		
		/**
		 * 음수 인경우 공백을 리턴.
		 * @param negativeNumber
		 * @return
		 */
		public static String negativeNumberToEmpty(int negativeNumber) {
			return negativeNumber < 0 ? "" : Integer.toString(negativeNumber);
		}
		
		public static String negativeNumberToEmpty(String negativeNumber) {
			return negativeNumberToEmpty(Integer.parseInt(negativeNumber));
		}
		
		/**
		 * 0 인경우 공백을 리턴.
		 * @param number
		 * @return
		 */
		public static String zeroToEmpty(int number) {
			return number == 0 ? "" : Integer.toString(number);
		}
		
		public static String zeroToEmpty(String number) {
			return zeroToEmpty(Integer.parseInt(number));
		}
		
		
		public static String maskName(String name){
			 if ( name == null ) return name;
			 name = substr(name, name.length()-1, "*");
	        return name;
		}
	}
