package com.dn.spring.user.support;

import java.lang.reflect.Method;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dn.spring.security.SecurityService;
import com.dn.spring.security.domain.Security;
import com.dn.spring.security.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.dn.common.ThreadContext;
import com.dn.common.utils.StringUtils;
import com.dn.common.utils.ValidationUtils;
import com.dn.spring.annotations.CheckAuth;
import com.dn.spring.annotations.RequestProperty;
import com.dn.spring.annotations.RequestPropertyData;
import com.dn.spring.category.CategoryService;
import com.dn.spring.user.domain.UserInfo;

public class AuthInterceptor implements HandlerInterceptor{
 
	@Autowired
	SecurityService securityService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerMethod method = (HandlerMethod) handler;
		
		CheckAuth auth = method.getMethodAnnotation(CheckAuth.class);

		ThreadContext.put("requestPropertyData", handleRequestPropertiy(handler));
		ThreadContext.put("user", securityService.getCurrentUser());


		return true;
	}
 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		if(!response.isCommitted()){
			/*HttpSession session = request.getSession();
			User userDetail = (User) session.getAttribute("user");
			
			if( userDetail != null ) {
				modelAndView.addObject("userDetail", userDetail);
			}*/

			modelAndView.addObject("title", ((RequestPropertyData) ThreadContext.get("requestPropertyData")).getTitle());
			modelAndView.addObject("user", ThreadContext.get("user"));
		}
	}
 
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
	
	/**
	 * @RequestProperty 애노테이션 데이터를 처리한다.
	 */
	private RequestPropertyData handleRequestPropertiy(Object handler) {
		
		//this.requestContext = requestContext;
		
		RequestProperty requestPropertyClass = (RequestProperty) ((HandlerMethod) handler).getBean().getClass().getAnnotation(RequestProperty.class);

		Method method = ((HandlerMethod) handler).getMethod();
		
		String layout = "blank";
		String template = "front";
		String title = "";
	
		// 1. 클래스의 RequestMapping의 value 정보
		if (ValidationUtils.isNotNull(requestPropertyClass)) {
			if (requestPropertyClass.title() != null && !"".equals(requestPropertyClass.title())) {
				title = requestPropertyClass.title();
			}
			if (requestPropertyClass.template() != null && !"".equals(requestPropertyClass.template())) {
				template = requestPropertyClass.template();
			}
			if (requestPropertyClass.layout() != null && !"".equals(requestPropertyClass.layout())) {
				layout = requestPropertyClass.layout();
			}
		}
		
		// 2. 메서드 정보.
		if (isRequestPropertyMethod(method)) {
			
			RequestProperty requestPropety = AnnotationUtils.getAnnotation(method, RequestProperty.class);
			
			if (ValidationUtils.isNotNull(requestPropety)) {
				if (!StringUtils.isNull(requestPropety.title()))
					title = requestPropety.title();
				
				if (!StringUtils.isNull(requestPropety.layout()))
					layout = requestPropety.layout();
				
				if (!StringUtils.isNull(requestPropety.template()))
					template = requestPropety.template();
				
			}
		}
		
		RequestPropertyData requestPropertyData = new RequestPropertyData();
		
		requestPropertyData.setLayout(layout);
		requestPropertyData.setTitle(title);
		requestPropertyData.setTemplate(template);
	
		return requestPropertyData;
		
	}
	
	protected boolean isRequestPropertyMethod(Method method) {
		return AnnotationUtils.findAnnotation(method, RequestProperty.class) != null;
	}
	
	
}
