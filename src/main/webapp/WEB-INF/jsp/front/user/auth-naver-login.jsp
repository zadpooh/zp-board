<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
var flagResult = '${flagResult}';

switch (flagResult) {
	case "UE9999"    : 
		alert("Naver 로그인 중 오류가 발생 되었습니다.");
	    break;
	case "UE9998"   : 
		alert("Naver 로그인 중 오류가 발생 되었습니다.");
		break;
	case "UE9997"   : 
		alert("접근경로가 다릅니다.");
		break;
	case "UE0000"  : 
		alert("동일한 아이디가 존재 합니다.");
		break;
	case "UE0001"  : 
		alert("회원 정보 가입경로가 다릅니다.");
		break;
// 	case "UE0002"  : 
// 		alert("회원 정보 누락되었습니다.");
// 		break;
	default    : 
		window.opener.loginOk();
		break;
}

self.close();

</script>