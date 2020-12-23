<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세부</title>
<link rel="stylesheet" href="/res/css/detail.css">
</head>
<body>
<div class="detailContainer">
        <div class="boardTitle">
            ${data.title}
        </div>
        <div class="userContainer">
            <!-- 상단 정보 -->
            <div class="userInfo">
                <div id="userNm">${data.nm}</div>
                <div id="date">${data.r_dt}</div>
                <div class="btns">
                	<c:if test="${loginUser.nm == null}">
                		<button type="button" class="commonBtn" onclick="moveToRegScr(${data.i_board}, '${data.pw}')">수정</button>
                		<button type="button" class="commonBtn" onclick="moveToDelScr(${data.i_board}, '${data.pw}')">삭제</button>
                	</c:if>
                	<c:if test="${loginUser.nm != null}">
                		<button type="button" class="commonBtn" onclick="moveToReg(${data.i_board})">수정</button>
                		<button type="button" class="commonBtn" onclick="moveToDel(${data.i_board})">삭제</button>
                	</c:if>
                </div>
            </div>

            <!-- 내용 -->
            <div class="textDiv">
                <div id="divHr1"></div>
                <div class="textAreaDiv">
                	${data.ctnt}
                </div>
            </div>
        </div>        

        <div class="cmtListBox">
            <div class="cmtList">
            
                <div class="cmtFlex">
                    <div class="cmtNick">Test321 테스트임</div>
                    <div class="cmtDate">2020-10-10 20:34 테스트임</div>
                </div>
                <!-- 안되면 pre로 바꾸기 -->
                <div class="cmtSel">
                                         댓글 내용적기
                </div>
                


                <!-- 테스트 cmtList 안에 append 해야됨-->
                <div class="cmtFlex">
                    <div class="cmtNick">Test321</div>
                    <div class="cmtDate">2020-10-10 20:34</div>
                </div>
                <!-- 안되면 pre로 바꾸기 -->
                <div class="cmtSel">
                                        댓글 내용적기
                </div>
                
            </div>
        </div>

        <!-- 아작스로 댓글 입력창 만들기 -->
        <div class="insCmtContainer">
            <form id="frm">
                <div>
                    <input id="cmtIns" type="text" name="cmtNm" placeholder="닉네임">
                </div>
                <div class="textZ">
                    <textarea id="cmtText" cols="135" rows="6" name="cmtcnt" style="resize: none;">fasd</textarea>
                    <button type="button" id="cmtRegBtn" onclick="cmtRegBtn()">댓글 입력</button>
                </div>
            </form>
        </div>

        <!-- 댓글 -->
        <div class="cmtContainer">
            <div class="cmtDivMo">
                
            </div>
        </div>
        
        
        <!-- 수정 모달 -->
        <div id="myModalCer" class="modal">
	 
			<!-- Modal content -->
			<div class="modal-content">
			      <h2>비밀번호를 입력해 주세요</h2>
			    <!-- Modal body -->
			    <div class="modal-body">
			    	<form id="scrFrm" action="/board/detail" method="post" onsubmit="return chk()">
			    		<input id="cerCodeIns" type="password" name="pw" placeholder="비밀번호 입력">
			    		<input type="hidden" name="i_board" value="${data.i_board}">
			    		<input id="submitIns" type="submit" value="확인">
			    	</form>
			    </div>
			    <button type="button" class="pop_bt" onclick="close_pop()">
						종료
				</button>
			</div>
	    </div>
	    
	    <!-- 삭제 모달 -->
        <div id="delModal" class="modal">
	 
			<!-- Modal content -->
			<div class="modal-content">
			      <h2>비밀번호를 입력해 주세요</h2>
			    <!-- Modal body -->
			    <div class="modal-body">
			    	<form id="delFrm" action="/board/del" method="get" onsubmit="return chk()">
			    		<input id="cerCodeIns" type="password" name="delPw" placeholder="비밀번호 입력">
			    		<input type="hidden" name="i_board_del" value="${data.i_board}">
			    		<input id="submitIns" type="submit" value="확인">
			    	</form>
			    </div>
			    <button type="button" class="pop_bt" onclick="delclose_pop()">
						종료
				</button>
			</div>
	    </div>
	    
	    
	    
    </div>




    <div class="height">
    
    </div>






<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	//일반유저가 비밀번호 틀렸을시 
	if(${scrFalse != null}) {
		alert('${scrFalse}')
	}

    // 관리자 수정 삭제 (비번입력안함)
    function moveToReg(i_board) {
		location.href="/board/reg?i_board="+i_board
    }

    function moveToDel(i_board) {
    	if(confirm('삭제 하시겠습니까 ?')) {
    		location.href="/board/del?i_board="+i_board	
    	}
    }
	// ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	
	
	
	// 일반 수정삭제 (비번입력 O)
	function moveToRegScr(i_board, pw) {
		scrFrm.i_board.value = i_board		
		$('#myModalCer').show();
		scrFrm.pw.focus()
    }

    function moveToDelScr(i_board, pw) {
    	if(confirm('삭제 하시겠습니까 ?')) {
    		delFrm.i_board_del.value = i_board		
    		$('#delModal').show();
    		scrFrm.pw.focus()	
    	}
    }
	
	// @@@@@@@@@@@@@@@@@@@@@@@@
	
	
	// 비밀번호 입력창 --------
	$('#myModalCer').hide();
	
	function close_pop(flag) {
		 $('#myModalCer').hide();
	}
	
	// 비밀번호 입력창 --------
	$('#delModal').hide();
	
	function delclose_pop(flag) {
		 $('#delModal').hide();
	}
	
	
	
	
	
	// 댓글
    function cmtRegBtn() {

    }

</script>
</body>
</html>