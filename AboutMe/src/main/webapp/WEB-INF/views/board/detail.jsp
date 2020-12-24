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
            <div id="cmtListMall" class="cmtList">
            	 <!-- 
                <div class="cmtFlex">
                    <div class="cmtNick">Test321 테스트임</div>
                    <div class="cmtDate">2020-10-10 20:34 테스트임</div>
                    
                </div>
                
                <!-- 안되면 pre로 바꾸기
                <div class="cmtSel">
                                         댓글 내용적기
                </div>
                
                <button class="delCmtBtn" onclick="delCmt()">삭제</button>
                


                <!-- 테스트 cmtList 안에 append 해야됨
                <div class="cmtFlex">
                    <div class="cmtNick">Test321</div>
                    <div class="cmtDate">2020-10-10 20:34</div>
                </div>
                <!-- 안되면 pre로 바꾸기 
                <div class="cmtSel">
                                        댓글 내용적기
                </div>
                 -->
                
            </div>
        </div>

        <!-- 아작스로 댓글 입력창 만들기 -->
        <div class="insCmtContainer">
            <form id="cmtFrm" onsubmit="return chk()">
                <div>
                    <input id="cmtIns" type="text" name="cmtNm" placeholder="닉네임">
                    <input id="cmtPwId" type="password" name="cmtPw" placeholder="비밀번호">
                </div>
                <div class="textZ">
                    <textarea id="cmtText" cols="135" rows="6" name="ctnt" style="resize: none;"></textarea>
                    <button type="button" id="cmtRegBtn" onclick="cmtRegBtnCall(${data.i_board})">전송</button>
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
	    
	    
	    <!-- 댓글 삭제 모달 -->
        <div id="delCmtModal" class="modal">
	 
			<!-- Modal content -->
			<div class="modal-content">
			      <h2>비밀번호를 입력해 주세요</h2>
			    <!-- Modal body -->
			    <div class="modal-body">
			    	<form id="delCmtFrm" action="/cmt/cmtDel" method="post" onsubmit="return chk()">
			    		<input id="dleCmtPw" type="password" name="cmtPw" placeholder="비밀번호 입력">
			    		<input type="hidden" id="i_board" name="i_board" value="${data.i_board}">
			    		<input type="hidden" id="i_cmtId" name="i_cmt">
			    		<input id="submitIns" type="submit" value="확인">
			    	</form>
			    </div>
			    <button type="button" class="pop_bt" onclick="delCmtclose_pop()">
						종료
				</button>
			</div>
	    </div>
	    
    </div>




    <div class="height">
    
    </div>





<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	// 댓글 삭제시 비밀번호 틀릴 경우 
	if(${cmtFalse != null}) {
		alert('${cmtFalse}')
	}

	//ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	댓 글 ㅡ	ㅡ	ㅡ	ㅡ	ㅡ
	function cmtRegBtnCall(i_board) {
		const ctnt = cmtFrm.ctnt.value
		const cmtNm = cmtFrm.cmtNm.value
		const cmtPw = cmtFrm.cmtPw.value
		
		if(cmtIns.value == '' || cmtIns.value.length > 9) {
			alert('올바른 닉네임을 입력해 주세요')
			cmtIns.focus()
			return false;
		}
		
		if(cmtText.value == '') {
			alert('댓글을 입력해 주세요')
			cmtText.focus()
			return false;
		}
		
		if(cmtPwId.value == '') {
			alert('비밀번호를 입력해 주세요')
			cmtPw.focus()
			return false
		}
		
		if(cmtPwId.value.length > 29) {
			alert('비밀번호가 너무 깁니다')
			cmtPw.focus()
			return false
		}
		
		axios.post('/cmt/cmtReg',{
			ctnt : ctnt,
			i_board : i_board,
			cmtNm : cmtNm,
			cmtPw : cmtPw
			
		}).then(function(res) {
			if(res.data == 1) {
				cmtFrm.cmtNm.value = ''
				cmtFrm.ctnt.value = ''
				cmtFrm.cmtPw.value = ''
				cmtListMall.innerHTML = ''
				ajaxSelCmt()
				
			} else {
				alert('댓글 전송중 오류가 발생하였습니다. 잠시후 다시 시도해 주세요')
			}
		})
	}
	
	// 댓글 뿌리는 메소드
	function ajaxSelCmt() {
		
		axios.get('/cmt/selCmt', {
			params: {
				i_board : `${data.i_board}`
			}
		}).then(function(res) {
			refreshMenu(res.data)
		})
		
	}
	
	// makeCmtList 함수를 계속 만들어냄
	function refreshMenu(arr) {
		for(let i=0; i<arr.length; i++) {
			makeCmtList(arr[i])
		}
	}
	
	// 댓글 리스트 append
	function makeCmtList(arr) {
		
		var cmtFlexDiv = document.createElement('div')
		cmtFlexDiv.setAttribute('class', 'cmtFlex')
		cmtListMall.append(cmtFlexDiv)
		
		var cmtNickDiv = document.createElement('div')
		cmtNickDiv.setAttribute('class', 'cmtNick')
		cmtNickDiv.append(arr.cmtNm)
		cmtFlexDiv.append(cmtNickDiv)
		
		
		var cmtDateDiv = document.createElement('div')
		cmtDateDiv.setAttribute('class', 'cmtDate')
		cmtDateDiv.append(arr.r_dt)
		cmtFlexDiv.append(cmtDateDiv)
		
		var cmtSelDiv = document.createElement('div')
		cmtSelDiv.setAttribute('class', 'cmtSel')
		cmtSelDiv.append(arr.ctnt)
		cmtListMall.append(cmtSelDiv)
		
		// 삭제기능 넣기
		var delCmtBtn = document.createElement('button')
		delCmtBtn.setAttribute('class', 'delCmtBtn')
		delCmtBtn.innerText = '삭제'
		delCmtBtn.onclick = function() {
			$('#delCmtModal').show();
			delCmtFrm.i_board.value = `${data.i_board}`
			delCmtFrm.i_cmt.value = arr.i_cmt
		}
		cmtListMall.append(delCmtBtn)
	}
	
	ajaxSelCmt()	// 아작스 댓글 뿌리기
	//	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ	ㅡ
	
		

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
	
	// 비밀번호 입력창 --------
	$('#delCmtModal').hide();
	
	function delCmtclose_pop(flag) {
		 $('#delCmtModal').hide();
	}
	
	
	
	
	
	

</script>
</body>
</html>