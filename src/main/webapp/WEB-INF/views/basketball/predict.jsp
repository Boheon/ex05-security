<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@include file="../layouts/header.jsp"%>


<h1 class="page-header my-5 mx-auto"  style="width:600px">
	<i class="far fa-edit"></i> 농구 포지션
</h1>

<div class="panel panel-default mx-auto" style="width:600px">

	<div class="panel-body">
	
		<form:form modelAttribute="basketballVO" role="form">	
			<input type="hidden" name="_csrf" value="${_csrf.token}" />
			<div class="form-group">
				<form:label path="p3">3점슛</form:label>
				<form:input path="p3" cssClass="form-control" />
			</div>

			<div class="form-group">
				<form:label path="p2">2점슛</form:label>
				<form:input path="p2" cssClass="form-control" />
			</div>
			
			<div class="form-group">
				<form:label path="trb">트래블링 반칙</form:label>
				<form:input path="trb" cssClass="form-control" />
			</div>
			
			<div class="form-group">
				<form:label path="ast">도움</form:label>
				<form:input path="ast" cssClass="form-control" />
			</div>

			<div class="form-group">
				<form:label path="stl">스틸</form:label>
				<form:input path="stl" cssClass="form-control" />
			</div>

			<div class="form-group">
				<form:label path="blk">슛 블럭</form:label>
				<form:input path="blk" cssClass="form-control" />
			</div>

			<div class="form-group">
				<label>결과</label>
				<div>${result}</div>
			</div>



			<button type="submit" class="btn btn-primary list">
				<i class="fas fa-check"></i> 확인
			</button>
			<button type="reset" class="btn btn-primary">
				<i class="fas fa-undo"></i> 취소
			</button>
		</form:form>
	</div>
</div>


<%@include file="../layouts/footer.jsp"%>
