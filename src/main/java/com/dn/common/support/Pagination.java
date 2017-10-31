package com.dn.common.support;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.dn.common.utils.NumberUtils;
import com.dn.common.utils.StringUtils;

public class Pagination implements Serializable {
	private static final long serialVersionUID = 6132690304990218292L;
	public static final int PAGE_SIZE = 10;
	public static final int DEFAULT_CURRENT_PAGE = 1;
	public static final int DEFAULT_ITEMS_PER_PAGE = 10;
	public static final String DEFAULT_DB_VENDOR = "mysql";
	
	public static final String REPLACE_PAGE_PATTERN = "[page]";
	public static final String DEFAULT_JAVASCRIPT_FUNCTION = "javascript:pagination(" + REPLACE_PAGE_PATTERN + ")";
	
	private String baseUrl = "";
	private String link = "";
	private int totalItems = 0;
	private int itemsPerPage = 10;
	private int currentPage = 1;
	
	private boolean autoHide = false;
	
	// Auto
	private int totalPages;
	private int currentFirstItem;
	private int currentLastItem;
	private int firstPage;
	private int lastPage;
	private int previousPage;
	private int nextPage;
	
	private int itemNumber;

	// Oracle
	private int startRownum;
	private int endRownum;
	
	// Mysql 
	private int startLimit;
	private int endLimit;
	
//	@Autowired(required=true)
//	private HttpServletRequest request;
	
	private Pagination(int totalItems, int itemPerPage) {
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		
		String contextPath = request.getContextPath();
		
		String requestUri = request.getRequestURL().toString().replaceFirst(contextPath, "");
		String queryString = request.getQueryString();
		// 페이징 URL

		String qString = "";
		if (!StringUtils.isEmpty(queryString)) {
			if (queryString.indexOf("page=") == -1) {
				qString = queryString + "&page=" + REPLACE_PAGE_PATTERN;
			} else {
				qString = queryString.replaceAll("page=[0-9]+", "page=" + REPLACE_PAGE_PATTERN);
			}
				
		} else {
			qString = "page=" + REPLACE_PAGE_PATTERN;
		}
		this.link = requestUri + "?" + qString;
		
		this.totalItems = totalItems;
		int currentPage = requstParam(request.getParameter("page"));
		this.currentPage = NumberUtils.zero2value(currentPage, DEFAULT_CURRENT_PAGE);
		
		this.itemsPerPage = itemPerPage;
		
		if (requstParam(request.getParameter("itemsPerPage")) > 0) {
			this.itemsPerPage = requstParam(request.getParameter("itemsPerPage"));
		}
		
	
		calculateRownum();
	}
	
	
	private int requstParam(Object requestParameter) {
		
		if (requestParameter == null || ((String) requestParameter) == "") {
			return 0;
		} else {
			
			return Integer.parseInt((String) requestParameter);
		}
	}
	
	public static Pagination getInstance(int totalItems) {
		return new Pagination(totalItems, DEFAULT_ITEMS_PER_PAGE);
	}
	

	/**
	 * 객체 생성 
	 * @param requestContext RequestContext
	 * @param totalItems 전체 데이터 
	 * @param itemsPerPage 한 페이지에 표시할 데이터 
	 * @return
	 */
	public static Pagination getInstance(int totalItems, int itemsPerPage) {
		return new Pagination(totalItems, itemsPerPage);
	}
	

	
	
	private void calculateRownum() {
//		String db = this.dbVendor == null ? DEFAULT_DB_VENDOR : this.dbVendor;
//		
//		if (db.equals("oracle")) {
//			this.startRownum = (int) (this.currentPage - 1) * this.itemsPerPage + 1;
//			this.endRownum = this.currentPage * this.itemsPerPage;
//			
//		} else if (db.equals("mysql")) {
//			this.startRownum = (int) (this.currentPage - 1) * this.itemsPerPage;
//			this.endRownum = this.itemsPerPage;
//			
//		} else if (db.equals("mssql")) {
//			this.startRownum = (int) (this.currentPage - 1) * this.itemsPerPage + 1;
//			this.endRownum = this.currentPage * this.itemsPerPage;
//		}
		
		this.startRownum = (int) (this.currentPage - 1) * this.itemsPerPage;
		this.endRownum = this.itemsPerPage;
	}


	public int getTotalItems() {
		return totalItems;
	}

	public int getItemsPerPage() {
		return itemsPerPage;
	}
	
	public void setItemsPerPage(int itemsPerPage) {
		this.itemsPerPage = itemsPerPage;
		calculateRownum();
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return this.totalPages = (int) Math.ceil((double) this.totalItems / (double) this.itemsPerPage);
	}

	public int getCurrentFirstItem() {
		return (int) Math.min(((this.currentPage - 1) * this.itemsPerPage) + 1, this.totalItems);
	}

	public int getCurrentLastItem() {
		return (int) Math.min(this.currentFirstItem + this.itemsPerPage - 1, this.totalItems);
	}

	public int getFirstPage() {
		return (this.currentPage == 1) ? 0 : 1;
	}

	public int getLastPage() {
		return (this.currentPage >= this.totalPages) ? 0 : this.totalPages;
	}

	public int getPreviousPage() {
		return (this.currentPage > 1) ? this.currentPage - 1 : 0;
	}

	public int getNextPage() {
		return (this.currentPage < this.totalPages) ? this.currentPage + 1 : 0;
	}

	public int getItemNumber() {
		return getTotalItems() - (getItemsPerPage() * (getCurrentPage() - 1)) + 1;
	}
	
	public int getNumber() {
		return (getItemsPerPage() * (getCurrentPage() - 1));
	}
	
	
	public String getLink() {
		return this.link;
	}
	
	public void setLink(String link) {
		this.link = link;
	}

	public int getStartRownum() {
		return startRownum;
	}

	public int getEndRownum() {
		return endRownum;
	}

	public int getStartLimit() {
		return startLimit;
	}

	public void setStartLimit(int startLimit) {
		this.startLimit = startLimit;
	}

	public int getEndLimit() {
		return endLimit;
	}

	public void setEndLimit(int endLimit) {
		this.endLimit = endLimit;
	}
}
