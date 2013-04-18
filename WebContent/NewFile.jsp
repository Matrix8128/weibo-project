<%@page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>test</title>
<link rel="stylesheet" type="text/css" href="css/main.css">


</script>

<script>
	//为了在chrome控制台中调试用
	var dataTest
	var viTest
	
	function errorHandler(data) {
		if (data.hasOwnProperty("error")){
			alert(data.error)
			return false
		}
		return true
	}

	function submitUser() {
		if ($('#username').val().length == 0) {
			alert("can't be blank");
		} else {
			//alert($('#username').val());
			$.ajax({
				type : "get",//使用post方法访问后台
				dataType : "json",//返回json格式的数据
				url : "service.jsp",//要访问的后台地址
				contentType : "application/json;charset=utf-8",
				data : {
					username : $('#username').val(),
					levels : $("#levels").val(),
					types : $("#types").val(),
				},//要发送的数据
				beforeSend : function() {
					$("b").html("<font color='red'>ajax数据处理中,请稍后...</font>");
				},

				complete : function() {
					$("b").html("<font color='red'>ajax数据处理完毕</font>");
				},//AJAX请求完成时
				success : function(data) {//data为返回的数据，在这里做数据绑定
					//jsonArray数组 用each遍历
					dataTest = data
					if (errorHandler(data)) {
						 var vi = Visualization("#workplace", "#viewport", data);
						viTest = vi 
					}
					
				},
				error : function(XMLResponse) {
					alert(XMLResponse.responseText)
				}
			});

		}
	}
</script>
</head>

<body>

	<div id="dashboard">
		<ul class="controls">
			<li><span>@</span> <input class="span2" id="username"
				placeholder="搜索博主" type="text"></li>
			<li><span>关系网络层数</span> <select id="levels">
					<option value=1>1</option>
					<option value=2>2</option>
					<option value=3>3</option>
					<option value=4>4</option>
			</select></li>
			<li><span>展示类型</span> </select> <select id="types">
					<option value="relation">纯关系</option>
					<option value="interest">兴趣相似度</option>
					<option value="intimacy">亲密度</option>
			</select></li>
			<li><input type="button" value="提交" id="search"
				onclick="submitUser()"></li>

			<li><b></b></li>
		</ul>

		<div id="workplace">
			<canvas id="viewport">
	Your browser does not support the HTML5 canvas tag.
	
		</div>

		</canvas>

		<!-- 需要导入的lib -->
		<script src="js/vendor/jquery-1.9.1.min.js"></script>
		<script src="js/vendor/jquery.address-1.4.min.js"></script>
		<script src="js/vendor/arbor.js"></script>
		<script src="js/vendor/arbor-tween.js"></script>
		<script src="js/vendor/arbor-graphics.js"></script>
		<!-- 项目js -->
		<script src="js/visualization.js"></script>
		<script src="js/renderer.js"></script>
</body>
</html>
