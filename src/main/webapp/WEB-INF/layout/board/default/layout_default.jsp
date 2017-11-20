<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<tiles:insertAttribute name="header" />
</head>

<body>

	<tiles:insertAttribute name="top" />

	<tiles:insertAttribute name="body" />

	<tiles:insertAttribute name="bottom" />

</body>

</html>