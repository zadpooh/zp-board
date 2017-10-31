package com.dn.spring;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.JOptionPane;

import com.dn.common.utils.StringUtils;


public class MakeStatementMysql {
	private static String BASE_PACKAGE = "com.";

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String inputData = JOptionPane.showInputDialog("[ 구문 생성기 ]\n데이터베이스 컬럼 값을 입력하세요");
		
		if (inputData.trim().equals("")) {
			
			System.out.println("값을 정확히 입력해 주세요.");
			System.exit(0);
		}
		
		System.out.println();
		
		String[] columns = StringUtils.tokenizeToStringArray(inputData, " ");
		
		String[] fieldss = StringUtils.tokenizeToStringArray(columns[0], "\t");
		
		
		String packageName = "com.dn."+fieldss[0].replace("_ID", "").replace("_","").toLowerCase()+".domain.";
		String packageName2 = "com.dn."+fieldss[0].replace("_ID", "").replace("_","").toLowerCase()+".support.";
		
		StringBuilder sb = new StringBuilder();
		

		
		
		if (columns.length > 0) {
			// Domain Field
			System.out.println("Domain\n------------------------------------------------------");
			for (String field : columns) {
				if (field.equals("CHAR)")) {
					continue;
				}
				
				if (field.equals("unsigned")) {
					continue;
				}
				
				
				String column = field;
				String type = "";
				
				if (field.indexOf("\t") > -1) {
					
					String[] fields = StringUtils.tokenizeToStringArray(field, "\t");
					column = fields[0];
					type = fields[1];
				} 
				
				
				String camelColumn = converToCamel(column.toLowerCase());

				if (type.toLowerCase().indexOf("tiny") > -1) {
					sb.append("	private int " + camelColumn + ";\n");
				
				}
				else if (type.toLowerCase().indexOf("bigint") > -1) {
					sb.append("	private int " + camelColumn + ";\n");
				
				}
				else if (type.toLowerCase().indexOf("int") > -1) {
					sb.append("	private int " + camelColumn + ";\n");
				
				}
				else if (type.toLowerCase().indexOf("decimal") > -1) {
					sb.append("	private BigDecimal " + camelColumn + ";\n");
				
				} else {
					sb.append("	private String " + camelColumn + ";\n");
					
				}
				
				
			}
			
			System.out.println(sb.toString());
			
			
			System.out.println();
			System.out.println();
			sb = null;
			
			
			
			// ResultMap
			System.out.println("ResultMap\n------------------------------------------------------");
			sb = new StringBuilder();
			
			sb.append("	<resultMap id=\"\" type=\""+packageName+"\">\n");

			
			int j = 0;
			for (String field : columns) {
				if (field.equals("CHAR)")) {
					continue;
				}
				
				if (field.equals("unsigned")) {
					continue;
				}
				
				String column = field;
				String type = "";
				
				if (field.indexOf("\t") > -1) {
					String[] fields = StringUtils.tokenizeToStringArray(field, "\t");
					column = fields[0];
					type = fields[1];
				} 
				
				String camelColumn = converToCamel(column.toLowerCase());
				
				sb.append("		<result property=\"" + camelColumn + "\" column=\"" + column + "\" />\n");
				
				j++;
			}
			
			sb.append("	</resultMap>");
			System.out.println(sb.toString());
			System.out.println();
			System.out.println();
			
			
			// SELECT LIST
			System.out.println("SELECT LIST\n------------------------------------------------------");
			sb = new StringBuilder();
			
			sb.append("	<select id=\"\" parameterType=\""+packageName2+"Param\" resultMap=\"Result\" >\n");
			//sb.append("		<include refid=\"CommonMapper.paginationHeader\" />\n");
			
			String seField = "			SELECT "+"\n";
			
			int k = 0;
			String tableName = "";  
			for (String field : columns) {
				if (field.equals("CHAR)")) {
					continue;
				}
				if (field.equals("unsigned")) {
					continue;
				}
				String column = field;
				String type = "";
				
				if (field.indexOf("\t") > -1) {
					String[] fields = StringUtils.tokenizeToStringArray(field, "\t");
					column = fields[0];
					type = fields[1];
				} 
				
				String camelColumn = converToCamel(column.toLowerCase());
				
				if (k == 0) {
					tableName =  "			FROM TB_" + column.replace("_ID", "") + " ";
				}
				

				seField += "				"+column;
				
				if (k < columns.length - 1) {
					seField += ", ";
				}
				
				seField += "\n";
				
				k++;
			}
			
			seField += ""+tableName+"\n";
			
			sb.append(seField);
			//sb.append("		<include refid=\"CommonMapper.paginationFooter\" />\n");
			sb.append("	</select>");
			System.out.println(sb.toString());
			System.out.println();
			System.out.println();
			
			// SELECT INFO
			System.out.println("SELECT INFO\n------------------------------------------------------");
			sb = new StringBuilder();
			
			sb.append("	<select id=\"\" parameterType=\""+packageName2+"\" resultMap=\"Result\" >\n");
			
			String seiField = "		SELECT "+"\n";
			
			int p = 0;
			String tableName2 = "";  
			for (String field : columns) {
				if (field.equals("CHAR)")) {
					continue;
				}
				if (field.equals("unsigned")) {
					continue;
				}
				String column = field;
				String type = "";
				
				if (field.indexOf("\t") > -1) {
					String[] fields = StringUtils.tokenizeToStringArray(field, "\t");
					column = fields[0];
					type = fields[1];
				} 
				
				String camelColumn = converToCamel(column.toLowerCase());
				
				if (p == 0) {
					tableName2 =  "		FROM TB_" + column.replace("_ID", "") + " \n 		WHERE "+column+" = ${"+camelColumn+"}";
				}
				
	
				
				seiField += "			"+column;
				
				if (p < columns.length - 1) {
					seiField += ", ";
				}
				seiField += "\n";
				
				p++;
			}
			
			seiField += ""+tableName2+"\n";
			
			sb.append(seiField);
			sb.append("	</select>");
			System.out.println(sb.toString());
			System.out.println();
			System.out.println();
			
			
			// INSERT
			System.out.println("INSERT\n------------------------------------------------------");
			sb = new StringBuilder();
			
			sb.append("	<insert id=\"\" parameterType=\"" + packageName + "\">\n");
			
			String dbField = "		INSERT INTO ";
			String dbValue = "		VALUES (";
			
			int i = 0;
			String table = "";
			for (String field : columns) {
				if (field.equals("CHAR)")) {
					continue;
				}
				if (field.equals("unsigned")) {
					continue;
				}
				String column = field;
				String type = "";
				
				if (field.indexOf("\t") > -1) {
					String[] fields = StringUtils.tokenizeToStringArray(field, "\t");
					column = fields[0];
					type = fields[1];
				} 
				
				String camelColumn = converToCamel(column.toLowerCase());
				if (i == 0) {
					dbField = dbField + "TB_" + column.replace("_ID", "") + " (";
				}
				
				if (i > 0) {
					dbField += ", ";
					dbValue += ", ";
				}
				
				dbField += column;
				
				if (camelColumn.equals("createdDate") || camelColumn.equals("updatedDate")) {
					dbValue += "DATE_FORMAT(NOW(),'%Y%m%d%H%i%s')";
					
				} else {
					dbValue += "#{" + camelColumn + "}";
				}
				
				
				
				i++;
			}
			
			dbField += ")\n";
			dbValue += ")\n";
			
			sb.append(dbField);
			sb.append(dbValue);
			sb.append("	</insert>");
			System.out.println(sb.toString());
			System.out.println();
			System.out.println();
			
			
			// UPDATE
			sb = null;
			System.out.println("UPDATE\n------------------------------------------------------");
			sb = new StringBuilder();
			
			sb.append("	<update id=\"\" parameterType=\"" + packageName + "\">\n");
			
			
			
			i = 0;
			String firstCamelColumn = "";
			String firstColumn = "";
			for (String field : columns) {
				if (field.equals("CHAR)")) {
					continue;
				}
				if (field.equals("unsigned")) {
					continue;
				}
				String column = field;
				String type = "";
				
				if (field.indexOf("\t") > -1) {
					String[] fields = StringUtils.tokenizeToStringArray(field, "\t");
					column = fields[0];
					type = fields[1];
				} 
				
				String camelColumn = converToCamel(column.toLowerCase());
				
				if (i == 0) {
					
					sb.append("		UPDATE TB_" + column.replace("_ID", "") + " SET\n");
					
				}
		
				if (i > 0) {
					if (i > 1) {
						sb.append(", \n");
					}
					sb.append("			" + column + " = #{" + camelColumn + "}");
				} else {
					firstCamelColumn = camelColumn;
					firstColumn = column;
				}
				

				
				i++;
			}
			
			sb.append("\n		WHERE " + firstColumn + " = ${" + firstCamelColumn + "}\n");
			sb.append("	</update>");
			System.out.println(sb.toString());
			System.out.println();
			System.out.println();
			
			
			
			// DELETE
			System.out.println("DELETE\n------------------------------------------------------");
			sb = new StringBuilder();
			
			sb.append("	<delete id=\"\" parameterType=\""+packageName+"\" >\n");
			
			String deField = "		DELETE FROM ";
			
			int n = 0;
			String tableName3 = "";  
			for (String field : columns) {
				if (field.equals("CHAR)")) {
					continue;
				}
				if (field.equals("unsigned")) {
					continue;
				}
				String column = field;
				String type = "";
				
				if (field.indexOf("\t") > -1) {
					String[] fields = StringUtils.tokenizeToStringArray(field, "\t");
					column = fields[0];
					type = fields[1];
				} 
				
				String camelColumn = converToCamel(column.toLowerCase());
				
				if (n == 0) {
					tableName3 =  "TB_" + column.replace("_ID", "") + " \n		WHERE "+column+" = ${"+camelColumn+"}";
				}
				
				n++;
			}
			
			deField += ""+tableName3+"\n";
			
			sb.append(deField);
			sb.append("	</delete>");
			System.out.println(sb.toString());
			System.out.println();
			System.out.println();
			
		} else {
			System.out.println("오류가 발생했습니다.");
			System.exit(0);
			
		}
		
		
		
		
		
		

	}
	
	/**
	 * 카멜 케이스로 변
	 * @param str
	 * @return
	 */
	private static String converToCamel(String str) {
        String repStr = str;
        Pattern p = Pattern.compile("\\_[a-z]{1}");
        Matcher m = p.matcher(str);
        int cnt = 0;

        while (m.find()) {
            repStr = m.replaceFirst(m.group().replaceAll("\\_","").toUpperCase());
            m = p.matcher(repStr);
           // System.out.println("repCnt : " + cnt + " / repStr : " + repStr);
            cnt++;
        }
        return repStr;
	}
}

