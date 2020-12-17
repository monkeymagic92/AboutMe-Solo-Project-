<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ddmarketTag</title>
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
            <div id="hibabyFont">DDmarket</div>
            <img class="hibabyImg" src="/res/img/DDmarket.jpg">
        </div>
        <br>
        <div>
            <div class="urlDiv">
                <ul>
                    <li>URL : <a id="urlA" href="http://ddmarket.ga/index/main" target="_blank">http://ddmarket.ga/index/main</a></li>
                    <li>담당 분야 : <span id="span1">Back-End</span></li>
                </ul>
                                
            </div>
            <p class="infoP">
                DDmarket 같은경우 제인생에 첫 스프링 팀프로젝트이며 저를 성장 시켜준 프로젝트이기도 합니다<br>
                제가 팀에서 백엔드를 맡았으며, 처음엔 Controller 매핑도 제대로 못하였지만 끝까지 책임지기로 했으니<br>
                아침부터 새벽까지 매일 프로젝트를 하며 저를 성장 할수있게 해준 계기 이기도 합니다<br><br>

                DDmarket은 단디마켓의 줄임말로 대구사투리 중 '단디해라' 라는 사투리를 본따서 DDmarket 이라는 이름을 지었습니다<br>
                각 지역별 중고거래로 등록된 인기상품, 최신상품, 지역별 상품을 나타내며<br>
                둘만의 대화로 거래를 하고 판매자가 대화한 구매자 리스트에서 한명을 초이스해 거래완료 후<br>
                리뷰작성까지 한번에 실행하여 깨끗하고 신뢰있는 중고거래 문화를 만들자는 취지에서 DDmarket 프로젝트를 진행하였습니다<br>
            </p>
        </div>

        <div class="movieInfo">
            <video src="/res/av/DDmarket/Djoin.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">1. 회원 가입(정규화), 주소API</h2>
                <ul class="infoUl">
                    <li class="infoLi">중복확인은 Ajax통신을 이용하였으며, 중복확인후 내용이 변경된경우 다시 체크</li>
                    <br>
                    <li class="infoLi">비밀번호는 salt 암호화 기법을 사용하여 회원가입후 DB에 값 저장시 난수로 저장</li>
                    <br>
                    <li class="infoLi">아이디:영어,숫자 / 이메일:이메일형식 / 비밀번호:영어,특수문자,숫자 포함 정규화 작업</li>
                    <br>
                    <li class="infoLi">지도API는 다음주소API를 사용</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/DDmarket/DfindPw.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">2. 비밀번호 찾기 (실제 이메일 발송)</h2>
                <ul class="infoUl">
                    <li class="infoLi">JavaMailSender를 활용하여 회원가입시 입력한 이메일로 인증코드 6자리를 보내어 인증번호가 서로 일치하면 OK</li>
                    <br>
                    <li class="infoLi">아이디찾기 또한 위와 동일한 방식으로 일치하는 ID를 메일로 발송함</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/DDmarket/DsnsLogin.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">3. 카카오 / 네이버 로그인</h2>
                <ul class="infoUl">
                    <li class="infoLi">카카오에서 제공해주는 토큰을받아 DDmarket 프로젝트에 맞게 커스텀마이징</li>
                    <br>
                    <li class="infoLi">로그인후 추가적인 정보입력이 필요할 경우 회원가입창에서 필요한 항목만 띄움</li>
                    <br>
                    <li class="infoLi">네이버는 카카오와 다르게 로그인시 네이버 개발자승인이 필요함</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/DDmarket/Dboard.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">4. 게시글</h2>
                <ul class="infoUl">
                    <li class="infoLi">단일,다중 이미지 업로드, 카테고리 선택으로 추후 값을 뿌릴때 카테고리에 맞게 뿌려짐</li>
                    <br>
                    <li class="infoLi">게시글CRUD, 댓글 Ajax CRUD 적용, 조회수, 찜목록 기능, 욕,script 필터링 적용</li>
                    <br>
                    <li class="infoLi">조회수는 접속한IP를 기준으로 숫자를 올리기에 새로고침해서 올라가는행위 방지</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/DDmarket/Ddeal.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">5. 거래</h2>
                <ul class="infoUl">
                    <li class="infoLi">판매글에 여러명의 구매자가 구매신청 및 대화하기를 할수있으며 구매자는 다른 구매자 대화를 못보며 판매자는 전체 다볼수있음</li>
                    <br>
                    <li class="infoLi">구매신청 버튼을 누른 구매자 리스트 중에서 판매자가 거래가 끝나면 거래완료 버튼을 누른후 거래종료</li>
                    <br>
                    <li class="infoLi">거래가 끝나면 구매자 마이페이지에서 판매자에게 리뷰작성 가능</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/DDmarket/DtheRest.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">6. search,select</h2>
                <ul class="infoUl">
                    <li class="infoLi">카테고리 항목, 가격순, 인기순으로 세분화되어 검색 및 뿌려진 값들을 확인</li>
                    <br>
                    <li class="infoLi">index페이지는 항목별로 12개의 판매글만 보여주며 이미 사라진 글들은 DDmarket로고 하단 dropDown 메뉴에서 지난 판매글을 살펴볼수 있다</li>
                </ul>
            </div>
        </div>
        <br><br>
        <div class="movieInfo">
            <video src="/res/av/DDmarket/Dcookie.mp4" controls></video>
            <div class="titleDiv">
                <h2 id="infoH1">7. 쿠키영상</h2>
                <ul class="infoUl">
                    <li class="infoLi">마지막으로 사이트내에 재미난 판매글들만 따로 모아봤습니다</li>
                    <br>
                    <li class="infoLi">DDMarket은 중고물건 뿐만 아니라 중고란중고는 다 내놓을수있는 신개념 서비스를 도입했습니다</li>
                    <br>
                    <li class="infoLi">오늘도 고생하셨습니다 퇴근전 함박웃음 지으시길 바랍니다</li>
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