<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@include file="../layouts/header.jsp"%>


<h1 class="page-header my-5 mx-auto"  style="width:600px">
	<i class="far fa-edit"></i> 여행을 떠나도 될까?
</h1>

<div class="panel panel-default mx-auto" style="width:600px">

	<div class="panel-body">
	
		<form:form modelAttribute="titanicVO" role="form">	
			<input type="hidden" name="_csrf" value="${_csrf.token}" />
			<div class="form-group">
				<form:label path="sex">성별</form:label>
				<form:input path="sex" cssClass="form-control" />
			</div>

			<div class="form-group">
				<form:label path="age">나이</form:label>
				<form:input path="age" cssClass="form-control" />
			</div>
			
			<div class="form-group">
				<form:label path="sibsp">형제</form:label>
				<form:input path="sibsp" cssClass="form-control" />
			</div>
			
			<div class="form-group">
				<form:label path="fare">요금</form:label>
				<form:input path="fare" cssClass="form-control" />
			</div>


			<div class="form-group">
				<form:label path="class1">1등석</form:label>
				<form:input path="class1" cssClass="form-control" />
			</div>

			<div class="form-group">
				<form:label path="class2">2등석</form:label>
				<form:input path="class2" cssClass="form-control" />
			</div>


			<div class="form-group">
				<form:label path="class3">3등석</form:label>
				<form:input path="class3" cssClass="form-control" />
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
