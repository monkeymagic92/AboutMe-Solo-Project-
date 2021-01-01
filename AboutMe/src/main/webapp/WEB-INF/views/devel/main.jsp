<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/res/css/develMain.css">
</head>
<body>
	<div class="develContainer">
        <div class="boxDiv">
            <div class="btnsDiv">
                <span id="plusBtn" class="material-icons" onclick="plusBtn()">
                    add_circle_outline
                </span>
                <button class="allMinBtn" onclick="allMinBtn()">전체 삭제</button>
            </div>
            <form id="develInsFrm" action="/devel/main" method="post" onsubmit="return develInsChk()">
                <div id="formDivBox">
                	<!-- text 입력 창 -->
                    <!--
                    <div id="formDiv">
                        <div id="formMsg"></div>
                        <input class="formIns" type="text" name="ctn">
                        <button class="formMinBtn" type="button" onclick="">-</button>
                        <br>
                    </div>
                    -->
                </div>
                <br><br>
                <button id="submitBtn" type="submit">전송</button>
            </form>
        </div>
    </div>

    <div class="hrDiv">
        <hr>
        <!-- 추가할 내용 있으면 추가하기 -->
    </div>

    <!-- forEach 돌리기 -->
    <c:forEach items="${data}" var="item">
	    <div class="selViewDiv">
	        <span class="selDate">${item.r_dt}</span>
	        <form id="develViewFrm" class="develFrmCl" action="/devel/updMain" method="post" onsubmit="return develViewChk()">
		        <ul class="selViewUl">
		            <li class="selViewLi1">
		                1. ${item.ctn1}
		                <span>
		                	<c:if test="${item.ctnChk1 == 2}">
		                    	<img class="successImg" src="/res/img/success.jpg">
		                    </c:if>
		                    <span class="successChk">
			                    <c:if test="${successCode != null}">
			                        	완료<input class="selViewCheck" type="checkbox" name="ctnChk1" value="2">
			                    </c:if>
		                    </span>
		                </span>
		            </li>
		            <li>
		            	2. ${item.ctn2}
		                <span>
		                	<c:if test="${item.ctnChk2 == 2}">
		                    	<img class="successImg" src="/res/img/success.jpg">
		                    </c:if>
		                    <span class="successChk">
		                    <c:if test="${successCode != null}">
		                        	완료<input class="selViewCheck" type="checkbox" name="ctnChk2" value="2">
		                    </c:if>
		                    </span>
		                </span>
		            </li>
		            <li>
		            	3. ${item.ctn3}
		                <span>
		                	<c:if test="${item.ctnChk3 == 2}">
		                    	<img class="successImg" src="/res/img/success.jpg">
		                    </c:if>
		                    <span class="successChk">
		                    <c:if test="${successCode != null}">
		                        	완료<input class="selViewCheck" type="checkbox" name="ctnChk3" value="2">
		                    </c:if>
		                    </span>
		                </span>
		            </li>
		            <li>
		            	4. ${item.ctn4}
		                <span>
		                	<c:if test="${item.ctnChk4 == 2}">
		                    	<img class="successImg" src="/res/img/success.jpg">
		                    </c:if>
		                    <span class="successChk">
		                    <c:if test="${successCode != null}">
		                        	완료<input class="selViewCheck" type="checkbox" name="ctnChk4" value="2">
		                    </c:if>
		                    </span>
		                </span>
		            </li>
		            <li>
		            	5. ${item.ctn5}
		                <span>
		                	<c:if test="${item.ctnChk5 == 2}">
		                    	<img class="successImg" src="/res/img/success.jpg">
		                    </c:if>
		                    <span class="successChk">
		                    <c:if test="${successCode != null}">
		                        	완료<input class="selViewCheck" type="checkbox" name="ctnChk5" value="2">
		                    </c:if>
		                    </span>
		                </span>
		            </li>
		        </ul>
		        <c:if test="${successCode != null}">
		        	<button type="submit">Success Check</button>
		        	<input type="hidden" name="i_devel" value="${item.i_devel}">
		        </c:if>
	        </form>
	        <div class="viewBtns">
	        	<c:if test="${successCode == null}">
	            	<button class="viewUpdBtn" type="button" onclick="moveToUpd(${item.i_devel})">수정</button>
	            	<button class="viewUpdBtn" type="button" onclick="#">삭제</button>
	            </c:if>
	        </div>
	    </div>
    </c:forEach>
    
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function moveToUpd(i_devel) {
		location.href="/devel/updMain?i_devel="+i_devel
	}

	function develInsChk() {
		if(develInsFrm.ctn1.value == "") {
			alert('입력되지 않은 항목이 있습니다')
			return false;
		}
	}
	
	
	
	
	
	
	var textCount = 0
	var num = 0;
	var arr = [' ','1.','2.','3.','4.','5.']
	
	function plusBtn() {
	    ++textCount
	    
	    if(textCount > 5) {
	        textCount = 5
	        alert('너무 무리하지 마세요!!')
	        return false;
	    }
	    ++num
	    
	
	    var formDiv = document.createElement('div')
	    formDiv.setAttribute('id','formDiv' + num + '')
	
	    // 인풋창
	    var formIns = document.createElement('input')   
	    formIns.setAttribute('id', 'formInsId' + num + '')
	    formIns.setAttribute('class', 'formIns')
	    formIns.setAttribute('type', 'text')
	    formIns.setAttribute('name', 'ctn' + num + '')
	            
	    // 메세지
	    var formMsg = document.createElement('div')
	    formMsg.setAttribute('id', 'formMsg' + textCount + '')
	    formMsg.setAttribute('class', 'formMsg')
	    formMsg.append(arr[textCount])
	
	    formDiv.append(formMsg)
	    formDiv.append(formIns) // 입력창
	    delBtn(num,formDiv)     // 삭제버튼
	    
	    formDivBox.append(formDiv)  // 한셋트 완료
	}
	
	
	
	// input 창 하나당 삭제버튼 1개씩
	function delBtn(numParam, formDivParam) {
	    var formMinBtn = document.createElement('span')
	    formMinBtn.setAttribute('id','formMinBtn')
	    formMinBtn.setAttribute('class', 'material-icons')
	    formMinBtn.innerText = 'delete'
	
	    formMinBtn.onclick = function(){
	        --textCount
	        --num
	        $("#formDiv" + numParam + "").remove();
	    }
	    formDivParam.append(formMinBtn)
	}
	
	
	
	// 전체 삭제
	function allMinBtn() {
	    for(var i=0; i<6; i++) {
	        $("#formDiv" + i + "").remove();
	    }
	    textCount = 0
	    num = 0
	}
</script>
</body>
</html>