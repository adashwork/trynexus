<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">

<head>

<meta charset="UTF-8">

<title>マッチング結果・編集・登録</title>
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=M+PLUS+1p" rel="stylesheet">
<link href="../css/bootstrap-reboot.css" rel="stylesheet">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/header.css" rel="stylesheet">
<link href="../css/footer.css" rel="stylesheet">
<link rel="stylesheet" href="../css/default.css">
<link rel="stylesheet" href="../css/default.date.css">
<!-- <link href="css/ootuka.css" rel="stylesheet"> -->
<link href="../css/matchingregist.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/i18n/jquery.ui.datepicker-ja.min.js"></script>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/Base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/i18n/jquery.ui.datepicker-ja.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/matching_idsearch.js"></script>

</head>

<body>
	<%@ include file="/header.jsp" %>
	<!-- TODO headerにログイン名が表示されない点の調査　-->

<!-- 	<header> -->
<!--  		<section> -->
<!--   			<h1 class="logo"> -->
<!-- 				<a href="/nexus/web/staff-top"><img src="../css/TryNexus-Logo.png" width="97" height="70" alt="TryNexus" /></a> -->
<!-- 			</h1> -->

<!--  			<nav> -->
<!-- 				<ul class="mainnavi"> -->
<!-- 					<li><a href="/nexus/web/job-search"><i class="fas fa-home"></i>検索</a></li> -->
<!-- 					<li><a href="/nexus/web/jobseeker-list"><i class="fas fa-search"></i>登録&amp;閲覧</a> -->
<!-- 						<ul class="drop-menu"> -->
<!-- 							<li><a href="/nexus/web/kyujin-disp">求人情報<i class="fas fa-angle-right"></i></a></li> -->
<!-- 							<li><a href="/nexus/web/jobseeker-list">求職者情報<i class="fas fa-angle-right"></i></a></li> -->
<!-- 							<li><a href="/nexus/web/matching-registdisp">マッチング登録<i class="fas fa-angle-right"></i></a></li> -->
<!-- 						</ul> -->
<!-- 					</li> -->
<%-- 					<c:if test="${Staff.authority == 1}"> --%>
<%-- 					<li><a href="/nexus/web/account-list"><i class="far fa-bookmark"></i>管理</a></li></c:if> --%>
<!-- 				</ul> -->
<!-- 			</nav> -->
<!-- 			<div class="user"> -->
<!-- 				<div class="user__wrapper"> -->
<!-- 					<div class="user__name"> -->
<%-- 						<a href="#"><c:out value="${ Staff.name }" /><i class="fas fa-ellipsis-v"></i></a> --%>
<!-- 						<ul class="drop-menu"> -->
<!-- 							<li><a href="/nexus/web/logout">ログアウト<i class="fas fa-angle-right"></i></a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->
<!-- 	</header> -->

	<main> <!-- body部分　-->

		<h2>マッチング結果・編集・登録</h2>		<!-- TODO：結果・編集・登録に表示を変える -->

		<ul>
			<c:forEach var="message" items="${ messages }">
				<li><font color=#F00 size="5"><c:out value="${ message }" /></font></li>
			</c:forEach>
		</ul>

 		<form id="form" method="post" action="">	<!-- TODO:「action」未設定 -->

<!-- テーブル部分　-->

		<table border="0">

			<tr>
				<th width="30%">
					マッチングID
				</th>
				<td width="35%">	<!-- komukai 2018/12/19 マッチングID欄：コメントアウト -->
<!-- 					<input type="text" name="no" size="10" value="">  -->
	  	 			<input type="hidden" name="nohidden" value="<c:out value="${ matching.id }" />">
					<fmt:formatNumber value="${ matching.id }" pattern="00000000"/>
				</td>
				<td width="35%">

				</td>
			</tr>
			<tr>
				<th width="30%">
					事業所番号
				</th>
				<td align="left" width="35%">
																	<!-- komukai　2018/12/26 ID検索ボタン内編集 -->
					<input type="text" name="companyNo" size="10" maxlength="13" id="company_id"
						value="<c:out value="${ matching.companyNo }" />">
					<input type="button" value="事業所番号検索" id="company_sb">

				</td>
				<td align="right" width="35%">
					<span>企業名</span><input id="company_name" type="text" size="15" placeholder="読み取り専用" readonly />
				</td>
			</tr>
			<tr>
				<th width="30%">
					求人No
				</th>
				<td align="left" width="35%">
																	<!-- komukai　2018/12/26 ID検索ボタン内編集 -->
					<input type="text" name="kyujinno" size="10" maxlength="14" id="kyujin_id"
						value="<c:out value="${ matching.kyujinno }" />">
					<input type="button" value="求人No検索" id="kyujin_sb">
				</td>
				<td align="right" width="35%">
					<span>職種</span><input id="kyujin_job" type="text" size="15" placeholder="読み取り専用" readonly />
				</td>
			</tr>
			<tr>
				<th width="30%">
					求職者ID
				</th>
				<td align="left" width="35%">
																	<!-- komukai　2018/12/26 ID検索ボタン内編集 -->
					<input type="text" name="jobseekerid" size="10" maxlength="8" id="jobseeker_id"
						value="<c:out value="${ matching.jobseekerid }" />">
					<input type="button" value="求職者ID検索" id="jobseeker_sb" />
				</td>
				<td align="right" width="35%">
					<span>求職者名</span><input id="jobseeker_name" type="text" size="15" placeholder="読み取り専用" readonly />
				</td>
			</tr>
			<tr>
				<th width="30%">
					職業紹介者ID
				</th>
				<td width="35%">
					<input type="text" name="staffid" size="4" maxlength="4" onkeyup="if(event.keyCode==9||event.keyCode==16) return;
        				this.value=this.value.replace(/[^0-9]+/i,'');"
						<c:if test="${ matching.staffid == null }">value="<fmt:formatNumber value="${ Staff.id }" pattern="0000" />"</c:if>
						<c:if test='${ matching.staffid != null }'>value="<fmt:formatNumber value='${ matching.staffid }' pattern='0000' />"</c:if>
					>
				</td>
				<td width="35%">
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th> -->
<!-- 					履歴書送付日 -->
<!-- 				</th> -->
<!-- 				<td> -->
<!-- 					<input type="text" class="datepicker" size="10" name="interviewdt" -->
<%-- 					value="<fmt:formatDate value="${ matching.interviewdt }" pattern="yyyy-MM-dd"/>"> --%>
<!-- 				</td> -->
<!-- 				<td> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<th width="30%">
					面接日
				</th>
				<td width="35%">
					<input type="text" class="datepicker" size="10" name="interviewdt"
					value="<fmt:formatDate value="${ matching.interviewdt }" pattern="yyyy-MM-dd"/>">
				</td>
				<td width="35%">
				</td>
			</tr>
			<tr>
				<th width="30%">
					選考結果						<!-- TODO：採用不採用に変換してOKか -->
				</th>
				<td width="35%">
					<input name="assessment" type="radio" value="0"
					<c:if test="${ 1 != matching.assessment && 2 != matching.assessment }">checked="checked"</c:if>> 確認中
					<input name="assessment" type="radio" value="1"
					<c:if test="${ 1 == matching.assessment }">checked="checked"</c:if>> 採用
					<input name="assessment" type="radio" value="2"
					<c:if test="${ 2 == matching.assessment }">checked="checked"</c:if>> 不採用
				</td>
				<td width="35%">
				</td>
			</tr>
			<tr>
				<th width="30%">
					入社日
				</th>
				<td width="35%">
					<input type="text" class="datepicker" size="10" name="enterdt"
					value="<fmt:formatDate value="${ matching.enterdt }" pattern="yyyy-MM-dd"/>">
				</td>
				<td width="35%">
				</td>
			</tr>
			</table>
			<table border="0">
			<tr>
				<th colspan="3">
					フリーワード				<!-- TODO：入力後の処理、未 -->
				</th>
			</tr>
			<tr>									<!-- komukai　2018/12/18 タイトル・重要度追加 -->
				<td align="left" width="60%">
					<span>タイトル</span>
					<input type="text" size="30" name="title" value="<c:out value="${ comment.title }" />" maxlength="60">
				</td>
				<td align="left" width="40%">
					<span>重要</span>
					<c:if test="${ comment.important == 1 }">
						<input type="checkbox" name="important" value="1" checked>
					</c:if>
					<c:if test="${ comment.important == 0 || comment.important == null }">
						<input type="checkbox" name="important" value="1">
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="note" style="width:100%" maxlength="4000"><c:out value="${ comment.note }" /></textarea>
				</td>
			</tr>

		</table>

		<button type="button" class="main-b" onClick="location.href='./matching-search'">検索画面に戻る</button>
		<button type="button" class="main-b" onClick="location.href='./staff-top'">トップに戻る</button>
		<c:if test="${ matching.id == null || matching.id == 0 }">
				<button type="submit" id="matching-regist" class="main-b" onclick="MovePages(this)">登録</button>
		</c:if>
		<c:if test="${ matching.id != null && matching.id != 0 }">
			<button type="submit" id="matching-update" class="main-b" onclick="MovePages(this)">更新</button>
		</c:if>

	</form>

	</main>

	<!-- フッター　-->
	<footer>
		<small>Copyright(C) 2009有限責任事業組合 大阪職業教育協働機構(A'ワーク創造館) All Rights Reserved.</small>
	</footer>

</body>
</html>
