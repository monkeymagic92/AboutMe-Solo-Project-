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
            <form id="develFrm" action="/devel/main" method="post" onsubmit="return develChk()">
                <div id="develForm">
                    <!-- request.getParameterValues("name")으로 배열로 받기 -->
                    
                </div>
                <button type="submit">전송</button>
            </form>
        </div>
    </div>
	
	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var result = 0
	var num = 0
	
	function plusBtn() {
	    result++
	    if(result > 5) {
	        alert('경과됬음')
	        return false;
	    }
	    num++
	    console.log(num)
	    var develInput = document.createElement('input')
	    develInput.setAttribute('id', 'delBtn' + num + '')
	    develInput.setAttribute('type','text')
	    develInput.setAttribute('name', 'ctn' + num + '')
	    
	    develMinBtn = document.createElement('button')
	    develMinBtn.setAttribute('type', 'button')
	    develMinBtn.onclick = function(){
	    	$("#delBtn" + num + "").remove();
	    }
	    	
	    var develBr = document.createElement('br')
	
	    develForm.append(develInput)
	    develForm.append(develMinBtn)
	    develForm.append(develBr)
	}   
</script>
</body>
</html>