<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개발자 문의</title>
<link rel="stylesheet" href="/res/css/list.css">
</head>
<body>
	<div class="container">
        <div class="topMsg">
            <h3>개발자에게 하고싶은 말을 자유롭게 작성해 주세요</h3>
        </div>
        <div class="topContainer">
            <form id="frm" action="/board/list" method="get" onsubmit="return searchChk()">
                <label>
                    제목 <input type="radio" class="searchMenu" name="searchResult" value="1" checked>
                </label>
                <label>
                    작성자 <input type="radio" class="searchMenu" name="searchResult" value="2">
                </label>
                <input id="searchIn" type="text" name="search" placeholder="검색">
                <!--<span id="searchIcon" class="material-icons">search</span>-->
                <input id="searchBtn" type="submit" value="검색">
            </form>
            <button id="listBtn" type="button" onclick="listMall()">전체글</button>
            <button id="writeBtn" type="button" onclick="moveToReg()">글작성</button>
        </div>
        
        
        <div id="selCount">게시글 수(${totalCount})</div>
        
        
        <table cellpadding="10" cellspacing="0">
            <thead>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록날짜</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${data}" var="item">
            		<c:if test="${loginUser.nm == null}">
           				<c:if test="${item.scr == 2}">
           					<tr onclick="moveToDetailScr(${item.i_board}, '${item.pw}')">
	            				<th>비밀 게시글 입니다</th>
	            				<th>비밀 게시글 입니다</th>
	            				<th>${item.r_dt}</th>
            				</tr>
            			</c:if>
            			
            			<c:if test="${item.scr == 1}">
            				<tr onclick="moveToDetail(${item.i_board})">
		            			<th>${item.title}</th>
		            			<th>${item.nm}</th>
		            			<th>${item.r_dt}</th>
		            		</tr>
            			</c:if>
            		</c:if>
            		
            		
            		<c:if test="${loginUser.nm != null}">
            			<tr onclick="moveToDetail(${item.i_board})">
	            			<c:if test="${item.scr == 2}">
	            				<th>비밀 게시글 입니다</th>
	            				<th>비밀 게시글 입니다</th>
	            				<th>${item.r_dt}</th>
	            			</c:if>
	            			
	            			<c:if test="${item.scr == 1}">
		            			<th>${item.title}</th>
		            			<th>${item.nm}</th>
		            			<th>${item.r_dt}</th>
	            			</c:if>
	            		</tr>
	              	</c:if>
            	</c:forEach>
            </tbody>
        </table>
	
		<div class="pageBox">
	        <div class="page">	       
		        <c:if test="${pagination.curRange ne 1 }">
		            <a href="#" onClick="fn_paging(1)">[처음]</a> 
		        </c:if>
		        <div class="pageNumber">
		        <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
		            <c:choose>
		                <c:when test="${pageNum eq  pagination.curPage}">
		                	
		                    <span style="font-weight: bold; color: black;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
		                    
		                </c:when>
		                <c:otherwise>
		                	
		                    <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a>
		                     
		                </c:otherwise>
		            </c:choose>
		        </c:forEach>
		        </div>
		         <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
		            <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
		        </c:if>
	   		</div>
	   	</div>
        
        <div class="height">

        </div>
        
        
        <div id="myModalCer" class="modal">
	 
			<!-- Modal content -->
			<div class="modal-content">
			      <h2>비밀번호를 입력해 주세요</h2>
			    <!-- Modal body -->
			    <div class="modal-body">
			    	<form id="scrFrm" action="/board/list" method="post" onsubmit="return chk()">
			    		<input id="cerCodeIns" type="password" name="pw" placeholder="비밀번호 입력">
			    		<input type="hidden" name="i_board">
			    		<input id="submitIns" type="submit" value="확인">
			    	</form>
			    </div>
			    <button type="button" class="pop_bt" onclick="close_pop()">
						종료
				</button>
			</div>
	    </div>
    </div>
    
    
<script src="http://code.jquery.com/jquery-latest.min.js"></script>    
<script>

	// 전체글 버튼 눌렀을 시
	function listMall() {
		location.href="/board/list"
	}
	
	// 검색 유효검사
	function searchChk() {
		if(frm.search.value.length == 0) {
			alert('검색내용을 입력해 주세요')
			frm.search.focus()
			return false;
		} 
		
		if(frm.search.value.length > 20) {
			alert('검색내용이 너무 깁니다')
			frm.search.focus()
			return false;
		}
	}

	// 일반유저가 비밀번호 틀렸을시 
	if(${scrFalse != null}) {
		alert('${scrFalse}')
	}
	var userNm = `${loginUser.nm}`
	
	
	
	// 관리자가 비밀 상세페이지 접근시
	function moveToDetail(i_board) {
		location.href="/board/detail?i_board="+i_board
	}
	
	// 일반유저가 비밀 상세페이지 접근시(비번 입력하게끔)
	function moveToDetailScr(i_board, pw) {
		scrFrm.i_board.value = i_board		
		$('#myModalCer').show();
		scrFrm.pw.focus()
	}
	
	
	// 비밀번호 입력창 --------
	$('#myModalCer').hide();
	
	function moveToReg() {
		location.href="/board/reg"
	}
	
	function close_pop(flag) {
		 $('#myModalCer').hide();
	}
	// 비밀번호 입력------------
	
	// 페이징 값 보내기
	function fn_paging(curPage) {
		location.href = "/board/list?curPage="+curPage
	}
	
	myModalCer.style.display = 'none'
</script>
</body>
</html>