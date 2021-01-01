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
                <button class="plusBtn" onclick="plusBtn()">+</button>
                <button class="allMinBtn" onclick="allMinBtn()">전체 삭제</button>
            </div>
            <form id="develFrm" action="/devel/main" method="post" onsubmit="return develChk()">
                <div id="formDivBox">
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
    
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    var textCount = 0
    var num = 0;
    var arr = [' ','1. 좀더 분발하세요','2.','3.','4.','5.']

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
        var formMinBtn = document.createElement('button')
        formMinBtn.setAttribute('class', 'formMinBtn')
        formMinBtn.setAttribute('type', 'button')
        formMinBtn.innerText = 'ㅡ'

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