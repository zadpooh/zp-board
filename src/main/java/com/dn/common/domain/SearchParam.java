package com.dn.common.domain;

import java.io.Serializable;

import com.dn.common.support.Pagination;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class SearchParam implements Serializable {
	
	private int itemsPerPage = Pagination.DEFAULT_ITEMS_PER_PAGE;
	private int page;
	private int startRownum;
	private int endRownum;
	
	private String where;
	private String query;
	private String orderBy;
	private String sort;
	private String language;
	
	/**
	 * 조건 분기용 필드
	 * <pre>
	 * 예를 들어 같은 데이터 조회 하지만 관리자와 사용자에서 
	 * 사용되는 조건이 완전히 다른 경우 
	 * conditionType == 'admin', conditionType == 'front'로
	 * 분기하여 조건을 처리할 경우에 사용.
	 * </pre>
	 */
	private String conditionType;
	
	private String discriminator;	// ResultMap 조건 분기를 위한 컬럼.
	
	private int limit;		// pagination 없이 LIMIT 처리.
	
	// 여분 필드
	private String extra;
	
	
	private Pagination pagination;

	
	
	
}
