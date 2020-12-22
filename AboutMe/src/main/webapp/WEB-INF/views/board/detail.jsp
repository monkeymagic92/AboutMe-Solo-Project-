<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <button type="button" class="commonBtn" onclick="moveToReg(${data.i_board}, '${data.pw}')">수정</button>
                    <button type="button" class="commonBtn" onclick="moveToDel(${data.i_board}, '${data.pw}')">삭제</button>
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
                    dasdasdada
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
    </div>




    <div class="height">
    
    </div>






<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    
    function moveToReg(i_board, pw) {
		var promScr = prompt('비밀번호를 입력해 주세요')
		
		if(promScr == pw) {
			location.href="/board/reg?i_board="+i_board
					
		} else {
			alert('비밀번호가 틀렸습니다')
		}
    	
    }

    function moveToDel(i_board, pw) {
		var promScr = prompt('비밀번호를 입력해 주세요')
		
		if(promScr == pw) {
			location.href="/board/del?i_board="+i_board
					
		} else {
			alert('비밀번호가 틀렸습니다')
		}
        
    }

    function cmtRegBtn() {

    }

</script>
</body>
</html>