
	var canvas, context;
	$(document).ready(function() {//����׼��������λ�úʹ�С
		canvas = $("#myCanvas");
		context = canvas.get(0).getContext("2d");
		width = $(window).get(0).innerWidth;
		height = $(window).get(0).innerHeight;
		canvas.attr("width", width);
		canvas.attr("height", height);
		var x = 0;
		var y = $("#top").height();
		context.translate(x, y);
	});

	function submitUser() {
		
		if ($('#username').val().length == 0) {
			alert("can't be blank");
		} else {
			//alert($('#username').val());
			$.ajax({
				type : "get",//ʹ��post�������ʺ�̨
				dataType : "json",//����json��ʽ������
				url : "service.jsp",//Ҫ���ʵĺ�̨��ַ
				contentType : "application/json;charset=utf-8",
				data : {
					username : $('#username').val()
				},//Ҫ���͵�����
				beforeSend : function() {
					$("#status").html(
							"<font color='red'>ajax���ݴ�����,���Ժ�...</font>");
				},

				complete : function() {
					$("#status").html("<font color='red'>ajax���ݴ������</font>");
				},//AJAX�������ʱ
				success : function(data) {//dataΪ���ص����ݣ������������ݰ�
					
					draw(data);

				},
				error : function(XMLResponse) {
					alert(XMLResponse.responseText)
				}
			});

		}
	}

	function draw(data) {
		
		var inf = "centre:\n";
		inf += data.centre.uid + ":" + data.centre.name;
		inf += "\nothers:\n\n";
		
		$.each(data.jsonArray, function(index,item) {
			inf +="uid:" +item.uid + "\n";
			inf +="dist:" +item.distance + "\n";
		});
		alert(inf);
		context.fillStyle = "rgb(0,255,0)";
		context.fillRect(0, 0, 100, 100);
	}
