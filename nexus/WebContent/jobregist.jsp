<!-- @author ??? & pgjavaAT
	@author kemiyan(18年12月)
	18/09/30 閉じるボタンをトップへ戻るに変更
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>求人登録</title>
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=M+PLUS+1p"
	rel="stylesheet">
<link href="../css/bootstrap-reboot.css" rel="stylesheet">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/header.css" rel="stylesheet">
<link href="../css/footer.css" rel="stylesheet">
<link href="../css/job_regist.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/i18n/jquery.ui.datepicker-ja.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/Base/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/i18n/jquery.ui.datepicker-ja.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<main>
	<form id="form" method="post" action="">
		<div id="job_regist">
			<h2>求人登録</h2>

			<div id="message">

				<ul>
					<c:forEach var="message" items="${ messages }">
						<li><c:out value="${ message }" /></li>
					</c:forEach>
				</ul>
			</div>
			<table>
				<!-- 企業登録で入力すべき項目は事業所番号で引き込んで表示のみして入力はしない -->

				<tr>
					<th>求人No.</th>
					<td><input type="hidden" name="no"
						value="<c:out value="${ kyujin.no }" />"> <c:out
							value="${ kyujin.no }" /></td>
				</tr>
				<tr>
					<th>受付年月日 [必須]</th>
					<td><input type="text" class="datepicker" name="receptiondt"
						value="<fmt:formatDate value="${ kyujin.receptiondt }" pattern="yyyy-MM-dd"/>"
						size="10" maxlength="10" tabindex="2"></td>
				</tr>
				<tr>
					<th>求人有効年月日 [必須]</th>
					<td><input type="text" class="datepicker" name="perioddt"
						value="<fmt:formatDate value="${ kyujin.perioddt }" pattern="yyyy-MM-dd"/>"
						size="10" maxlength="10" tabindex="3"></td>
				</tr>
				<tr>
					<th>事業所番号 [必須]</th>
					<td><input type="text" name="companyno"
						value="<c:out value="${ kyujin.companyno }" />" size="20"
						maxlength="13" tabindex="4"></td>
				</tr>
				<tr>
					<th>事業所名（全角カナ）</th>
					<td><c:out value="${ company.companyKana }" /></td>
				</tr>
				<tr>
					<th>事業所名</th>
					<td><c:out value="${ company.companyName }" /></td>
				</tr>
				<tr>
					<th>事業所郵便番号</th>
					<td><c:out value="${ company.companyPostal }" /></td>
				</tr>
				<tr>
					<th>事業所所在地</th>
					<td><c:out value="${ company.companyPlace }" /></td>
				</tr>
				<tr>
					<th>事業所URL</th>
					<td><c:out value="${ company.companyUrl }" /></td>
				</tr>

				<!-- 1やりたかったメモ：一行テキストボックスはenter押すとすぐに登録なので
			submit変更かjsとかで制御、日本語入力オン-に（1807生記述） -->


				<!-- TODO 産業分類コードで表示されるので業種名で表示されるようにする -->
				<tr>
					<th>産業大分類コード</th>
					<td><c:out value="${ company.jobCategoryLargeCd }" /></td>
				</tr>
				<tr>
					<th>産業細分類コード</th>
					<td><c:out value="${ company.jobCategorySmallCd }" /></td>
				</tr>
				<tr>
					<th>創業設立年</th>
					<td><c:out value="${ company.establishDt }" /></td>
				</tr>
				<tr>
					<th>資本金（単位：百万円）</th>
					<td><c:out value="${ company.capital }" /></td>
				</tr>
				<tr>
					<th>従業員数</th>
					<td><c:out value="${ company.employees }" /></td>
				</tr>
				<tr>
					<%--					<th>会社の特徴</th>
					<td><textarea name="companyfeature" rows="3" cols="40"
							tabindex="14">
							<c:out value="${ kyujin.companyfeature }" /></textarea></td>
				</tr>
--%>
				<tr>
					<th>職種大分類コード１</th>

					<td><select id="joblcd1" name="joblargecd1" tabindex="15">
							<option value=""></option>
							<c:forEach var="job" items="${ Largelist }">
								<option value="${ job.largecd }"
									<c:if test="${ kyujin.joblargecd1 == job.largecd }">selected</c:if>>
									${ job.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>職種細分類コード１</th>
					<td><select id="jobscd1" name="jobsmallcd1" tabindex="16">
							<option value=""></option>
							<c:forEach var="job" items="${ Smalllist }">
								<option value="${ job.smallcd }"
									<c:if test="${ kyujin.jobsmallcd1 == job.smallcd}">selected</c:if>>
									${ job.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>職種大分類コード2</th>
					<td><select id="joblcd2" name="joblargecd2" tabindex="17">
							<option value=""></option>
							<c:forEach var="job" items="${ Largelist }">
								<option value="${ job.largecd }"
									<c:if test="${ kyujin.joblargecd2 == job.largecd }">selected</c:if>>
									${ job.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>職種細分類コード2</th>
					<td><select id="jobscd2" name="jobsmallcd2" tabindex="18">
							<option value=""></option>
							<c:forEach var="job" items="${ Smalllist }">
								<option value="${ job.smallcd }"
									<c:if test="${ kyujin.jobsmallcd2 == job.smallcd }">selected</c:if>>
									${ job.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>職種大分類コード3</th>
					<td><select id="joblcd3" name="joblargecd3" tabindex="19">
							<option value=""></option>
							<c:forEach var="job" items="${ Largelist }">
								<option value="${ job.largecd }"
									<c:if test="${ kyujin.joblargecd3 == job.largecd }">selected</c:if>>
									${ job.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>職種細分類コード3</th>
					<td><select id="jobscd3" name="jobsmallcd3" tabindex="20">
							<option value=""></option>
							<c:forEach var="job" items="${ Smalllist }">
								<option value="${ job.smallcd }"
									<c:if test="${ kyujin.jobsmallcd3 == job.smallcd }">selected</c:if>>
									${ job.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>就業場所郵便番号</th>
					<td><input type="text" name="postal" id="postal"
						value="<c:out value="${ kyujin.postal }" />" size="10"
						maxlength="8" tabindex="21"></td>
				</tr>

				<tr>
					<th>就業場所都道府県 [必須]</th>
					<td><select id="tdhken" name="addresscd" tabindex="22">
							<option value=""></option>
							<c:forEach var="todouhuken" items="${ list }">
								<option value="${ todouhuken.cd }"
									<c:if test="${ kyujin.addresscd == todouhuken.cd }">selected</c:if>>
									${ todouhuken.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>就業場所住所 [必須]</th>
					<td><input type="text" name="address" id="address"
						value="<c:out value="${ kyujin.address }" />" size="40"
						maxlength="90" tabindex="23"></td>
				</tr>
				<tr>
					<th>就業場所沿線</th>
					<td><input type="text" name="nearline"
						value="<c:out value="${ kyujin.nearline }" />" size="40"
						maxlength="30" tabindex="24"></td>
				</tr>
				<tr>
					<th>就業場所最寄り駅 [必須]</th>
					<td><input type="text" name="nearstationkj"
						value="<c:out value="${ kyujin.nearstationKyujin }" />" size="40"
						maxlength="30" tabindex="25"></td>
				</tr>
				<tr>
					<th>職種 [必須]</th>
					<td><input type="text" name="job"
						value="<c:out value="${ kyujin.job }" />" size="28" maxlength="28"
						tabindex="26"></td>
				</tr>
				<tr>
					<th>派遣/請負</th>
					<td><input type="radio" name="hakencd" value="1"
						<c:if test="${1 == kyujin.hakencd}" >checked="checked"</c:if>>
						派遣 <input type="radio" name="hakencd" value="2"
						<c:if test="${2 == kyujin.hakencd}" >checked="checked"</c:if>>
						請負 <input type="radio" name="hakencd" value="3"
						<c:if test="${1 != kyujin.hakencd && 2 != kyujin.hakencd }" >checked="checked"</c:if>>
						その他</td>

				</tr>
				<tr>
					<th>仕事の内容 [必須]</th>
					<td><textarea name="detail" rows="3" cols="40" tabindex="29"><c:out
								value="${ kyujin.detail }" /></textarea></td>
				</tr>
				<tr>
					<th>雇用形態</th>
					<td><select name="koyoukeitaicd" tabindex="30">
							<option></option>
							<option value="1"
								<c:if test="${1 == kyujin.koyoukeitaicd}">selected="selected"</c:if>>正社員</option>
							<option value="2"
								<c:if test="${2 == kyujin.koyoukeitaicd}">selected="selected"</c:if>>正社員以外</option>
							<option value="3"
								<c:if test="${3 == kyujin.koyoukeitaicd}">selected="selected"</c:if>>有期雇用派遣</option>
							<option value="4"
								<c:if test="${4 == kyujin.koyoukeitaicd}">selected="selected"</c:if>>無期雇用派遣</option>
							<option value="5"
								<c:if test="${5 == kyujin.koyoukeitaicd}">selected="selected"</c:if>>パート労働者</option>
							<option value="6"
								<c:if test="${6 == kyujin.koyoukeitaicd}">selected="selected"</c:if>>有期派遣パート</option>
							<option value="7"
								<c:if test="${7 == kyujin.koyoukeitaicd}">selected="selected"</c:if>>無期派遣パート</option>
					</select></td>
				</tr>
				<tr>
					<th>雇用期間の定め</th>
					<td><input type="text" name="koyoukikan"
						value="<c:out value="${ kyujin.koyoukikan}" />" size="40"
						maxlength="30" tabindex="31"></td>
				</tr>
				<tr>
					<th>雇用期間開始年月日</th>
					<td><input type="text" class="datepicker"
						name="koyoukikankaishi"
						value="<fmt:formatDate value="${ kyujin.koyoukikankaishi }" pattern="yyyy-MM-dd"/>"
						size="10" maxlength="10" tabindex="33"></td>
				</tr>
				<tr>
					<th>雇用期間終了年月日</th>
					<td><input type="text" class="datepicker"
						name="koyoukikanowari"
						value="<fmt:formatDate value="${ kyujin.koyoukikanowari }" pattern="yyyy-MM-dd"/>"
						size="10" maxlength="10" tabindex="34"></td>
				</tr>
				<tr>
					<th>学歴</th>
					<td><input type="text" name="education"
						value="<c:out value="${ kyujin.education }" />" size="40"
						maxlength="64" tabindex="35"></td>
				</tr>
				<tr>
					<th>必要な経験等</th>
					<td><input type="text" name="experience"
						value="<c:out value="${ kyujin.experience }" />" size="40"
						maxlength="84" tabindex="36"></td>
				</tr>
				<tr>
					<th>必要な免許・資格等</th>
					<td><input type="text" name="license"
						value="<c:out value="${ kyujin.license }" />" size="40"
						maxlength="84" tabindex="37"></td>
				</tr>
				<tr>
					<th>年齢制限・下限</th>
					<td><input type="number" name="agemin"
						value="<c:out value="${ kyujin.agemin }" />" size="8"
						maxlength="3" tabindex="38">歳</td>
				</tr>
				<tr>
					<th>年齢制限・上限</th>
					<td><input type="number" name="agemax"
						value="<c:out value="${ kyujin.agemax }" />" size="8"
						maxlength="3" tabindex="39">歳</td>
				</tr>
				<tr>
					<th>基本給下限</th>
					<td><input type="number" name="salarymin"
						value="<c:out value="${ kyujin.salarymin }" />" size="10"
						maxlength="7" tabindex="40">円</td>
				</tr>
				<tr>
					<th>基本給上限</th>
					<td><input type="number" name="salarymax"
						value="<c:out value="${ kyujin.salarymax }" />" size="10"
						maxlength="7" tabindex="41">円</td>
				</tr>
				<tr>
					<th>賃金形態</th>
					<td><input type="radio" name="salaryformcd" value="1"
						<c:if test="${1 == kyujin.salaryformcd}">checked="checked"</c:if>
						tabindex="42"> 月給 <input type="radio" name="salaryformcd"
						value="3"
						<c:if test="${3 == kyujin.salaryformcd}">checked="checked"</c:if>
						tabindex="43"> 日給 <input type="radio" name="salaryformcd"
						value="4"
						<c:if test="${4 == kyujin.salaryformcd}">checked="checked"</c:if>
						tabindex="44"> 時間給 <input type="radio" name="salaryformcd"
						value="5"
						<c:if test="${5 == kyujin.salaryformcd}">checked="checked"</c:if>
						tabindex="45"> 年棒 <input type="radio" name="salaryformcd"
						value="6"
						<c:if test="${1 != kyujin.salaryformcd && 3 != kyujin.salaryformcd &&
						 4 != kyujin.salaryformcd && 5 != kyujin.salaryformcd}">checked="checked"</c:if>
						tabindex="46"> その他</td>
				</tr>
				<tr>
					<th>賞与</th>
					<td><input type="text" name="bonus"
						value="<c:out value="${ kyujin.bonus }" />" size="20"
						maxlength="50" tabindex="47"></td>
				</tr>
				<tr>
					<th>通勤手当</th>
					<td><input type="text" name="koutuhi"
						value="<c:out value="${ kyujin.koutuhi }" />" size="20"
						maxlength="30" tabindex="48"></td>
				</tr>
				<tr>
					<th>諸手当</th>
					<td><input type="text" name="teate"
						value="<c:out value="${ kyujin.teate }" />" size="20"
						maxlength="30" tabindex="49"></td>
				</tr>
				<tr>
					<th>就業時間・始業</th>
					<td><input type="number" name="begintime"
						value="<c:out value="${ kyujin.begintime }" />" size="8"
						maxlength="4" tabindex="50"></td>
				</tr>
				<tr>
					<th>就業時間・終業</th>
					<td><input type="number" name="endtime"
						value="<c:out value="${ kyujin.endtime }" />" size="8"
						maxlength="4" tabindex="51"></td>
				</tr>
				<tr>
					<th>シフト制の場合は記入</th>
					<td><input type="text" name="shift"
						value="<c:out value="${ kyujin.shift }" />" size="40"
						maxlength="60" tabindex="52"></td>
				</tr>
				<tr>
					<th>フレックスタイム制の場合は記入</th>
					<td><input type="text" name="flex"
						value="<c:out value="${ kyujin.flex }" />" size="40"
						maxlength="60" tabindex="53"></td>
				</tr>
				<tr>
					<th>時短勤務制の有無</th>
					<td><input type="radio" name="jitan" value="1"
						<c:if test="${1 == kyujin.jitan}">checked="checked"</c:if>
						tabindex="54"> 有り <input type="radio" name="jitan"
						value="2"
						<c:if test="${1 != kyujin.jitan}">checked="checked"</c:if>
						tabindex="55"> 無し</td>
				</tr>
				<tr>
					<th>時間外労働 月平均</th>
					<td><input type="number" name="jikangai"
						value="<c:out value="${ kyujin.jikangai }" />" size="8"
						maxlength="2" tabindex="56"></td>
				</tr>
				<tr>
					<th>試用期間の有無（0～6ヶ月）</th>
					<td><input type="number" name="siyoukikan"
						value="<c:out value="${ kyujin.siyoukikan }" />" size="8"
						maxlength="1" tabindex="57"></td>
				</tr>
				<tr>
					<th>週所定労働日数</th>
					<td><input type="number" name="workdays"
						value="<c:out value="${ kyujin.workdays }" />" size="8"
						maxlength="1" tabindex="58"></td>
				</tr>
				<tr>
					<th>年間休日日数</th>
					<td><input type="text" name="nenkanholiday"
						value="<c:out value="${ kyujin.nenkanholiday }" />" size="40"
						maxlength="30" tabindex="59"></td>
				</tr>
				<tr>
					<th>選考担当者課係名/役職名</th>
					<td><c:out value="${ company.tantouYakushoku }" /></td>
				</tr>
				<tr>
					<th>選考担当者名（ひらがな）</th>
					<td><c:out value="${ company.tantouKana }" /></td>
				</tr>
				<tr>
					<th>選考担当者名</th>
					<td><c:out value="${ company.tantou }" /></td>
				</tr>
				<tr>
					<th>担当者TEL</th>
					<td><c:out value="${ company.tantouTel }" /></td>
				</tr>
				<tr>
					<th>担当者FAX</th>
					<td><c:out value="${ company.tantouFax }" /></td>
				</tr>
				<tr>
					<th>担当者email</th>
					<td><c:out value="${ company.tantouMail }" /></td>
				</tr>
				<tr>
					<th>担当者備考</th>
					<td><c:out value="${ company.tantouNote }" /></td>
				</tr>
				<tr>
					<th>担当職業紹介者ID</th>
					<td><c:out value="${ company.tantouStaffId }" /></td>
				</tr>
				<tr>
					<th>営業評価ランクABC</th>
					<td><c:out value="${ company.salesRank }" /></td>
				</tr>
				<tr>
					<th>営業備考</th>
					<td><c:out value="${ company.salesNote }" /></td>
				</tr>
				<tr>
					<th>応募書類</th>
					<td><textarea name="applicationform" rows="3" cols="40"
							tabindex="60"><c:out
								value="${ kyujin.applicationform }" /></textarea></td>
				</tr>
				<tr>
					<th>募集背景</th>
					<td><textarea name="background" rows="3" cols="40"
							tabindex="61"><c:out value="${ kyujin.background }" /></textarea></td>
				</tr>
				<tr>
					<th>募集人数</th>
					<td><input type="number" name="bosyunumbers"
						value="<c:out value="${ kyujin.bosyunumbers }" />" size="8"
						maxlength="4" tabindex="62"></td>
				</tr>
				<tr>
					<th>性別（求職者に非公開）</th>
					<td><input type="radio" name="hiddensex" value="1"
						<c:if test="${1 == kyujin.hiddensex}">checked="checked"</c:if>>
						男 <input type="radio" name="hiddensex" value="2"
						<c:if test="${2 == kyujin.hiddensex}">checked="checked"</c:if>>
						女 <input type="radio" name="hiddensex" value="3"
						<c:if test="${1 != kyujin.hiddensex && 2 != kyujin.hiddensex}">checked="checked"</c:if>>
						その他</td>
				</tr>
				<tr>
					<th>年齢下限（求職者に非公開）</th>
					<td><input type="number" name="hiddenagemin"
						value="<c:out value="${ kyujin.hiddenagemin }" />" size="8"
						maxlength="3">歳</td>
				</tr>
				<tr>
					<th>年齢上限（求職者に非公開）</th>
					<td><input type="number" name="hiddenagemax"
						value="<c:out value="${ kyujin.hiddenagemax }" />" size="8"
						maxlength="3">歳</td>
				</tr>
				<tr>
					<th>その他非公開情報</th>
					<td><textarea name="hiddenetc" rows="3" cols="40"
							tabindex="63"><c:out value="${ kyujin.hiddenetc }" /></textarea></td>
				</tr>
				<tr>
					<th>新規登録日</th>
					<td><input type="hidden" name="createdt"
						value="<fmt:formatDate value="${ kyujin.createdt }"
					pattern="yyyy-MM-dd"/>">
						<fmt:formatDate value="${ kyujin.createdt }" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>新規登録ユーザ</th>
					<td><input type="hidden" name="createuserid"
						value="<c:out value="${ kyujin.createuserid }" />"> <c:out
							value="${ kyujin.createuserid }" /></td>
				<tr>
					<th>最終更新日</th>
					<td><input type="hidden" name="updatedt"
						value="<fmt:formatDate value="${ kyujin.updatedt }"
					pattern="yyyy-MM-dd"/>">
						<fmt:formatDate value="${ kyujin.updatedt }" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>最終更新ユーザ</th>
					<td><input type="hidden" name="updateuserid"
						value="<c:out value="${ kyujin.updateuserid }" />"> <c:out
							value="${ kyujin.updateuserid }" /></td>
				</tr>

			</table>


			<button type="button" class="main-b"
				onClick="location.href='./job-search'" tabindex="70">求人一覧に戻る</button>

			<c:if test="${ kyujin.no == null }">
				<button type="submit" id="kyujin-insert" class="main-b"
					onclick="MovePages(this)" tabindex="70">登録</button>
			</c:if>
			<c:if test="${ kyujin.no != null }">
				<button type="submit" id="kyujin-update" class="main-b"
					onclick="MovePages(this)" tabindex="71">更新</button>
				<button type="submit" id="kyujin-delete" class="main-b2"
					onclick="MovePages(this)" tabindex="72">削除</button>
			</c:if>
		</div>
	</form>
	</main>
	<footer>
		<small>Copyright(C) 2009有限責任事業組合 大阪職業教育協働機構(A'ワーク創造館) All
			Rights Reserved.</small>
	</footer>
	<%--		<script src="../js/jobcategorypulldown.js" type="text/javascript"
		charset="utf-8"></script>
 				<script src="../js/jobcd.js" type="text/javascript"
		charset="utf-8"></script>
--%>
<script src="../js/postcode.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
