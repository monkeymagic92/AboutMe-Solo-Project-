<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.develContainer {
    margin: 0 auto;
    
}

#delBtn1 {
   	width: 20px;
   	height: 20px;
   	background-color: blue;
}

.boxDiv {
    margin-top: 100px;
    width: 800px;
    height: 200px;
    margin: 0 auto;
    
}
</style>
<body>
	<div class="develContainer">
        <div class="boxDiv">
            <button class="plusBtn" onclick="plusBtn()">+</button>
            <button class="allMinBtn" onclick="allMinBtn()">전체 삭제</button>
            <form id="develFrm" action="/devel/main" method="post" onsubmit="return develChk()">
                <div id="formDivBox">
                    <!--
                    <div id="formDiv">
                        <input id="formIns" type="text" name="ctn">
                        <button id="formMinBtn" type="button" onclick="">-</button>
                        <br>
                    </div>
                    -->
                </div>
                
                
                <button type="submit">전송</button>
            </form>
        </div>
    </div>
	
	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var textCount = 0 // 총 5개이상 못만들게
var num = 0; // name, id 추가 value 값

// 
function plusBtn() {
    ++textCount
    console.log(textCount)
    if(textCount > 5) {
        textCount = 5
        alert('경과됬음')
        return false;
    }
    ++num
    

    var formDiv = document.createElement('div')
    formDiv.setAttribute('id','formDiv' + num + '')

    var formIns = document.createElement('input')
    formIns.setAttribute('type', 'text')
    formIns.setAttribute('name', 'ctn' + num + '')
            
    var formBr = document.createElement('br')

    formDiv.append(formIns) // 입력창
    delBtn(num,formDiv)     // 삭제버튼
    formDiv.append(formBr)  // br
    
    formDivBox.append(formDiv)  // 한셋트 완료
}



// input 창 하나당 삭제버튼 1개씩
function delBtn(numParam, formDivParam) {
    var formMinBtn = document.createElement('button')
    formMinBtn.setAttribute('id', 'formMinBtn')
    formMinBtn.setAttribute('type', 'button')
    formMinBtn.innerText = ' - '

    formMinBtn.onclick = function(){
        --textCount
        --num
        $("#formDiv" + numParam + "").remove();
        
    }
    console.log('Minnum : ' + numParam)
    
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