<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
	
</script>

<script>
	function CheckAjax() {
		if ($('#username').val().length == 0) {
			alert("can't be blank");
		} else {
			alert($('#username').val());
			$.ajax({
						type : "get",//使用post方法访问后台
						dataType : "json",//返回json格式的数据
						url : "service.jsp",//要访问的后台地址
						contentType : "application/json;charset=utf-8",
						data : {
							username : $('#username').val()
						},//要发送的数据
						beforeSend : function() {
							$("span")
									.html(
											"<font color='red'>ajax数据处理中,请稍后...</font>");
						},

						complete : function() {
							$("span").html(
									"<font color='red'>ajax数据处理完毕</font>");
						},//AJAX请求完成时
						success : function(data) {//data为返回的数据，在这里做数据绑定
							//jsonArray数组 用each遍历
							$.each(data.jsonArray, function(index) {
								$.each(data.jsonArray[index], function(key,
										value) {
									alert(key + ":" + value)
									$('body').append(
											"<div>" + key + "---" + value
													+ "</div>").css("color",
											"red");
								});
							});

							//单个字符串输出  
							$('body').append("<div>" + data.account + "</div>")
									.css("color", "red");
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
	<table>
		<tr>
			<td><input type="text" id="username" name="username"
				title="username" onblur="CheckAjax();"></td>
		</tr>
		<tr>
			<td>
				<div class="hint"></div>
			</td>
		</tr>

		<tr>
			<td><span></span></td>
		</tr>
	</table>
</body>
</html>
