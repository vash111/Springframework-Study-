<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<%@ include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board Modify</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Board Modify Page</div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form action="/board/modify" method="post" role="form">
                
                	<input type="hidden" name="pageNum" value="${cri.pageNum}">
                	<input type="hidden" name="amount" value="${cri.amount}">
                	<input type="hidden" name="type" value="${cri.type}">
                	<input type="hidden" name="keyword" value="${cri.keyword}">
                
	                <div class="form-group">
	                	<label>Bno</label><input class="form-control" name="bno" value="${board.bno}" readonly="readonly">
	                </div>
	                <div class="form-group">
	                	<label>Title</label><input class="form-control" name="title" value="${board.title}">
	                </div>
	                <div class="form-group">
	                	<label>Text area</label><textarea rows="3" class="form-control" name="content">
	                	<c:out value="${board.content}"></c:out></textarea>
	                </div>
	                <div class="form-group">
	                	<label>Writer</label><input class="form-control" name="writer" value="${board.writer}" readonly="readonly">
	                </div>
	                <button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
	                <button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
	                <button type="submit" data-oper="list" class="btn btn-info">List</button>
                </form>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div> <!-- end row -->           

<script>
$(document).ready(function(){
	
	console.log("---------modify------")
	
	let  formObj = $("form");
	console.log(formObj)
	
	$("button").on("click", function(e){
		e.preventDefault();
		
		let operation = $(this).data("oper");
		
		if(operation === 'remove'){
			formObj.attr("action", "/board/remove");
		}else if(operation === 'list'){
			
			formObj.attr("action", "/board/list").attr("method", "get");
			
			let pageNumTag = $("input[name='pageNum']").clone();
			let amountTag = $("input[name='amount']").clone();
			let typeTag = $("input[name='type']").clone();
			let keywordTag = $("input[name='keyword']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(typeTag);
			formObj.append(keywordTag);
			
		}
		formObj.submit();
		
	})
});
</script>











<%@ include file="../includes/footer.jsp" %> 