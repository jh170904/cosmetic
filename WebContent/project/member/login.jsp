<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../layout/top.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

   	Cookie[] cookies=request.getCookies();
   	String id="";
   
	if(cookies!=null){
		for (Cookie c : cookies) {
	      
	      if(c.getName().indexOf("userId")!=-1){
	         //out.print("cookie name : " + c.getName() + "<br>");
	         id=URLDecoder.decode(c.getValue(), "UTF-8");
	         //System.out.println(c.getValue());
	      }
	   }
}
%>

<script src="../js/js.cookie.js"></script>
<script type="text/javascript">
function sendIt(){
	
	//아이디,비밀번호의 유효성검사
	
	var f= document.myForm;
			
 	str=f.userId.value;
	str=str.trim();
	if(!str){
		alert("아이디를 입력하세요!");
		f.userId.focus();
		return;
	}
	f.userId.value=str;
	
	str=f.userPwd.value;
	str=str.trim();
	if(!str){
		alert("패스워드를 입력하세요!");
		f.userPwd.focus();
		return;
	}
	f.userPwd.value=str; 

  	f.action="<%=cp%>/member/login_ok.do"; 
	f.submit();  

}

//비밀번호 input창에서 엔터눌렀을 경우 로그인 버튼 눌리게
function enterkey() {
    if (window.event.keyCode == 13) {

         // 엔터키가 눌렸을 때 실행할 내용
         sendIt();
    }
}

</script>


<div class="page_title_area">
	<!-- breadcrumb 미노출 페이지는 감춤 -->
	<div class="breadcrumb">

		<span>HOME</span> <span>로그인</span>

	</div>
	<!-- // breadcrumb 미노출 페이지는 감춤 -->
	<div class="page_title">


		<h2 class="h_title page">로그인</h2>

		<p class="text font_lg"></p>
	</div>
</div>

<!-- page contents -->
<form method="GET" id="sub" action="/main"></form>
<div class="ap_contents login">
	<div class="panel">
		<div class="panel_cont">
			<fieldset class="form">
				<legend class="sr_only">로그인 정보 입력</legend>
				<div class="join_info">
					<span class="txt">2018년 11월 부터 아모레퍼시픽 뷰티포인트 회원으로 통합하여 운영됩니다.</span>
					<a href="<%=cp %>/project/member/joinInfo.jsp" class="btn_join">자세히
						보기</a>
				</div>


				<div class="login_tab_contents">
					<!-- // 일반로그인 -->
					<div class="login_area">
						<form id="main" name="myForm">
							<div class="input_wrap">
								<input type="text" title="아이디 입력" name="userId" value="<%=id %>"
									placeholder="아이디" required="required"
									data-msg-required="아이디를 입력해 주세요. 아이디 입력란으로 이동합니다.">
							</div>
							<div class="input_wrap">
								<input type="password" title="비밀번호 입력" name="userPwd"
									placeholder="비밀번호" required="required" onkeyup="enterkey();"
									data-msg-required="비밀번호를 입력해 주세요. 비밀번호 입력란으로 이동합니다.">
							</div>
							<div class="clear">
								<div class="check_wrap">
									<input type="checkbox" id="save_id" name="id_ck"
										checked="checked"><label for="save_id">아이디 저장</label>
									<%-- <% if(id.length()>1)out.println("checked"); %> --%>

								</div>
								<div>
									<a href="<%=cp %>/member/searchid.do">아이디 찾기</a> │ <a
										href="<%=cp %>/member/searchpw.do">비밀번호 찾기</a>
								</div>
							</div>
							<button type="button" id="login" class="btn_primary_login"
								onclick="sendIt();">로그인</button>
						</form>

						<c:if test="${!empty message }">
							<script type="text/javascript">
							alert("아이디와 비밀번호가 틀렸습니다.");
							</script>
						</c:if>
					</div>


				</div>
			</fieldset>

			<hr class="div m20">
			<dl class="dl_cont">
				<dt class="h_title cont">아직도 회원이 아니세요?</dt>
				<dd>
					<p class="text">
						아모레퍼시픽계열 모든 쇼핑몰을 하나의 아이디로 편리하게, <br>통합멤버십(뷰티포인트)적립 및 다양한 서비스와
						혜택을 누리세요.
					</p>
					<a href="<%=cp%>/member/created.do"
						class="btn_md_bordered vertical">회원가입 </a>
				</dd>
			</dl>
		</div>
	</div>

</div>

<%@ include file="../layout/footer.jsp"%>































