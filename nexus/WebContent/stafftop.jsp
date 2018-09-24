<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>実習</title>
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"rel="stylesheet" >
<link href="https://fonts.googleapis.com/css?family=M+PLUS+1p" rel="stylesheet">
<link href="css/bootstrap-reboot.css" rel="stylesheet">
<link href="css/applicantlist.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/header.css" rel="stylesheet">
<link href="css/footer.css" rel="stylesheet">
<link href="css/stafftop.css" rel="stylesheet">
</head>
<body>

<header>
  <section>
    <h1 class="logo"><a href="./stafftop.jsp">LOGO</a></h1>
    <nav>
      <ul class="mainnavi">
        <li><a href="./job-search"><i class="fas fa-home"></i>検索</a></li>
        <li>
          <a href="./jobseeker-list"><i class="fas fa-search"></i>登録&amp;閲覧</a>
          <ul class="drop-menu">
            <li><a href="./kyujin-disp">求人情報<i class="fas fa-angle-right"></i></a></li>
            <li><a href="./jobseeker-list">求職者情報<i class="fas fa-angle-right"></i></a></li>
            <li><a href="./match-disp">マッチング登録<i class="fas fa-angle-right"></i></a></li>
          </ul>
        </li>
        <li><a href="./account-list"><i class="far fa-bookmark"></i>管理</a></li>
      </ul>
    </nav>
    <div class="user">
      <div class="user__wrapper">
        <div class="user__name">
          <a href="#"><c:out value="${ UserData.name }" /><i class="fas fa-ellipsis-v"></i></a>
          <ul class="drop-menu">
            <li><a href="./logout">ログアウト<i class="fas fa-angle-right"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
  </section>
</header>
<main>

<div><!--　コンテナー-->
	<div>
		<h2>トップページ</h2>
	</div>
	<!-- 検索メニュ　※URLはダミー　-->
	<div>
    <table class="staff-table">
    	<tr>
    	<th>
			<label>検索</label>
		</th>
        </tr>
        <tr>
        <td><a href="./job-search">■求人検索</a></td>
        </tr>
    </table>
	</div>

    <!-- 登録＆閲覧メニュー -->
	<div>
    <table class="staff-table">
    	<tr>
    	<th>
			<label>登録＆閲覧</label>
		</th>
        </tr>
        <tr>
        <td><a href="./kyujin-disp">■求人情報</a></td>
        </tr>
        <tr>
        <td><a href="./jobseeker-list">■求職者情報</a></td>
        </tr>
        <tr>
      <!--未実装   <td>■企業マスター</td> -->
        </tr>
        <tr>
        <td><a href="./match-disp">■マッチング登録</a></td>
        </tr>
    </table>
	</div>
    <!-- 管理メニュー　※URLはダミー　-->
	<div>
    <table class="staff-table">
    	<tr>
    	<th>
			<label>管理</label>
		</th>
        </tr>
        <tr>
        <td><a href="./account-list">■アカウント</a></td>
        </tr>
    </table>
	</div>


	<div>
	<div class="clear">
	<form name= "logout" method="GET" action="./logout">
    <input class="main-b" type="submit" name="close" value="ログアウト">
    </form>
	</div>



</div><!--　コンテナ終了-->
</main>
<footer>
  <small>Copyright(C) 2009有限責任事業組合 大阪職業教育協働機構(A'ワーク創造館)　All Rights Reserved.</small>
</footer>

</body>
</html>
