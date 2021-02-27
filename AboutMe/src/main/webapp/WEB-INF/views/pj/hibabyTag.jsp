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
                친구와 같이 1:1채팅을 통해 서로 의사소통을 하며<br>
                6~8세 아이들을 대상으로 난이도별로 수학,영어 공부기능이 있으며 난이도가 높을수록 문제당 포인트적립률을 높게 주어<br>
                추후 적립된 포인트를 캐시백 개념으로 부모님께 용돈을 받을수 있는 기능을 만들었습니다<br>
                어릴때부터 기초적인 공부와 동시에 경제관념을 세우며 그외 계급기능, 랭킹기능을 넣음으로서 더 분발할수있게 하였고<br>
                커뮤니티 게시판에서 서로간의 일상생활을 공유하며 아이들의 또다른 세상을 만들어주는 공간입니다<br><br>
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
            <video src="/res/av/HiBaby/fr.mp4" controls></video>
            <div class="titleDiv">
                <h1 id="infoH1">3. 친구 추가</h1>
                <ul class="infoUl">
                    <li class="infoLi">유저 검색에서 원하는 친구에게 친구요청을 함</li>
                    <br>
                    <li class="infoLi">친구추가 요청 상태일경우 상대방의 수락이 있어야하며 이미 등록된친구는 중복친구추가 방지</li>
                    <br>
                    <li class="infoLi">나자신은 친구추가, 대화하기를 할수 없음</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/HiBaby/HiChat.mp4" controls></video>
            <div class="titleDiv">
                <h1 id="infoH1">4. 1:1 채팅</h1>
                <ul class="infoUl">
                    <li class="infoLi">웹소켓을 활용하여 친구추가한 유저끼리 1:1 실시간 채팅</li>
                    <br>
                    <li class="infoLi">채팅내용은 DB에 저장되어 해당 유저와의 대화기록이 남음</li>
                    <br>
                    <li class="infoLi">나의 채팅창은 우측 / 상대방은 좌측으로 카카오톡 채팅과 유사한 화면 구성</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/HiBaby/study2.mp4" controls></video>
            <div class="titleDiv">
                <h1 id="infoH1">5. 공부 기능</h1>
                <ul class="infoUl">
                    <li class="infoLi">1.수학 : 난이도별로 숫자범위가 틀려지며 문제를 실행할때마다 난수값이 변경됨</li>
                    <br>
                    <li class="infoLi">2.영어 : 난이도별로 문제가 틀려지며, 문제가 중복되지않게 랜덤하게 10문제가 출제됨</li>
                    <br>
                    <li class="infoLi">난이도별로 한문제당 point획득량이 다르며, 정답확인시 오답과 문제풀이시간을 나타냄</li>
                </ul>
            </div>
        </div>
        
        <br><br>
        
        <div class="movieInfo">
            <video src="/res/av/HiBaby/program.mp4" controls></video>
            <div class="titleDiv">
                <h1 id="infoH1">6. 프로그램 기능</h1>
                <ul class="infoUl">
                    <li class="infoLi">생활속 작은 기능들을 모아 여러가지 심플한 기능을 다루는 페이지</li>
                    <br>
                    <li class="infoLi">1회성 프로그램 기능이므로 따로 DB에 값들이 저장되지 않음</li>
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