<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hibabyTag</title>
<link rel="stylesheet" href="/res/css/tag.css">
</head>
<body>
	<div class="container">
        <div class="alert">본 영상들에는 BGM이 깔려있습니다<br>
            조용한 곳에서 영상을 보시는분들은 음소거를 하시고 영상을 시청해주시기 바랍니다
            <br>
            영상화질이 흐릴경우 전체화면으로 시청해 주세요
            <br>
        </div>
        <div class="hibabyContainer">
            <div id="hibabyFont">HiBaby</div>
            <img class="hibabyImg" src="/res/img/HiBaby.jpg">
        </div>
        <br>
        <div>
            <div class="urlDiv">
                <ul>
                    <li>URL : <a id="urlA" href="http://118.67.130.227:8080/user/login" target="_blank">http://118.67.130.227:8080/user/login</a></li>
                    <li>담당 분야 : <span id="span1">Front-End, Back-End</span></li>
                </ul>
                                
            </div>
            
            <p class="infoP">
                Hibaby는 제가 웹개발 분야로 입문후 만든 첫 개인 프로젝트 입니다<br>
                지금으로부터 약 8개월전 아무것도 모르던 시절 파이썬을 배울때 에디터창에서 적은 코드들을<br>
                실제 다른컴퓨터로 접속시 일반 프로그램처럼 사용하는 방법이 궁금했던 적이 있었습니다 <a href="https://kin.naver.com/qna/detail.nhn?d1id=1&dirId=10402&docId=352284673" target="_blank">관련자료</a><br>
                그때당시 공부관련 기능들을 다른사람들도 사용할수있게 만들고싶었던 저의 작은꿈을 실천할수있게 해준 프로젝트 입니다<br><br>
                6~8세 아이들을 대상으로 난이도별로 수학,영어 공부기능이 있으며 난이도가 높을수록 문제당 포인트적립률을 높게 주어<br>
                추후 적립된 포인트를 캐시백 개념으로 부모님께 용돈을 받을수 있는 기능을 만들었습니다<br>
                어릴때부터 기초적인 공부와 동시에 경제관념을 세우며 그외 계급기능, 랭킹기능을 넣음으로서 더 분발할수있게 하였고<br>
                커뮤니티 게시판에서 서로간의 일상생활을 공유하며 아이들의 또다른 세상을 만들어주는 공간입니다<br><br>
                
                2020.12.18 기준으로 아직 미완성 프로젝트 입니다
                <br><br>
            </p>
        </div>

        <div class="movieInfo">
            <video src="/res/av/HiBaby/join.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">1. 회원 가입 (정규화)</h2>
                <ul class="infoUl">
                    <li class="infoLi">중복확인은 Ajax통신을 이용하였으며, 중복확인후 내용이 변경된경우 다시 체크를 하도록 구성</li>
                    <br>
                    <li class="infoLi">비밀번호는 salt 암호화 기법을 사용하여 회원가입후 DB에 값 저장시 난수로 저장</li><br>
                    <li class="infoLi">아이디:영어,숫자 / 이메일:이메일형식 / 비밀번호:영어,특수문자,숫자 포함 정규화 작업</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/HiBaby/findPw.mp4" controls></video>
            <div class="titleDiv">
                <h1 id="infoH1">2. 비밀번호 찾기 (이메일 발송)</h1>
                <ul class="infoUl">
                    <li class="infoLi">JavaMailSender를 활용하여 회원가입시 입력한 이메일로 인증코드 6자리를 보내어 인증번호가 서로 일치하면 OK</li>
                    <br>
                    <li class="infoLi">아이디찾기 또한 위와 동일한 방식으로 일치하는 ID를 메일로 발송함</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/HiBaby/boardAll.mp4" controls></video>
            <div class="titleDiv">
                <h1 id="infoH1">3. 게시판</h1>
                <ul class="infoUl">
                    <li class="infoLi">페이징과 검색, 다중이미지 등록, 게시판CRUD</li>
                    <br>
                    <li class="infoLi">Ajax통신을 활용한 댓글기능과 조회수 기능</li>
                    <br>
                    <li class="infoLi">XSS 공격을 대비해 욕필터링과 script필터링을 활용하여 건전한 커뮤니티 유지</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/HiBaby/study.mp4" controls></video>
            <div class="titleDiv">
                <h1 id="infoH1">4. 공부하기</h1>
                <ul class="infoUl">
                    <li class="infoLi">난이도선택이 가능하며 난이도별로 포인트 적립도가 다름</li>
                    <br>
                    <li class="infoLi">포인트보단 공부가 우선이기에 어떤문제가 틀렸는지, 몇초만에 문제를 풀었는지 에대한 정보가 나옴</li>
                    <br>
                    <li class="infoLi">그외 총누적포인트에 따른 계급기능, 랭킹 기능 도입중(2020.12.16 아직 미완성)</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/HiBaby/study.mp4" controls></video>
            <div class="titleDiv">
                <h1 id="infoH1">2. 비밀번호 찾기 (실제 이메일 발송)</h1>
                <ul class="infoUl">
                    <li class="infoLi"></li>
                    <br>
                    <li class="infoLi"></li>
                    <br>
                    <li class="infoLi"></li>
                </ul>
            </div>
        </div>
        
        <div id="end">
            여기까지 읽어주셔서 감사합니다.
        </div>
        
        <div class="height">

        </div>
        
    </div>
</body>
</html>