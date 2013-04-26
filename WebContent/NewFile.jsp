<%@page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>test</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<!-- 需要导入的lib -->
<script src="js/vendor/jquery-1.9.1.min.js"></script>
<script src="js/vendor/jquery.address-1.4.min.js"></script>
<script src="js/vendor/arbor.js"></script>
<script src="js/vendor/arbor-tween.js"></script>
<script src="js/vendor/arbor-graphics.js"></script>
<!-- 项目js -->

<script src="js/renderer.js"></script>
<script src="js/eventHandler.js"></script>
<script src="js/dataHandler.js"></script>

 <!-- the main driver code: start here -->
 <script src="js/visualization.js"></script>
</head>

<body>

	<div id="dashboard">
		<ul class="controls">
			<li><span>@</span> <input class="span2" id="username"
				placeholder="搜索博主" type="text"></li>
			<!-- <li><span>关系网络层数</span> <select id="levels">
					<option value=1>1</option>
					<option value=2>2</option>
					<option value=3>3</option>
					<option value=4>4</option>
			</select></li> -->
			<li><span>展示类型</span> </select> <select id="types">
					<option value="relation">纯关系</option>
					<option value="intimacy">亲密用户</option>
					<option value="interest">兴趣图谱</option>
					<option value="interest">相似用户</option>

					
			</select></li>
			<li><input type="button" value="提交" id="submitButton"
				onclick="submitUser()"></li>

			<li><b id="ajaxtip"></b></li>
			<!-- <li><b id="info"></b></li> -->
		</ul>

		<div id="workplace">
			<canvas id="viewport">
			Your browser does not support the HTML5 canvas tag. -->

		</div>
		<div id="editor">
				<div class="io"><b>节点信息</b></div>
				<div id="info" class="info">
					<ul>
					</ul>
				</div>
		</div>	
		<!-- <div id="grabber"></div> -->
		
		</canvas>
</body>
</html>
