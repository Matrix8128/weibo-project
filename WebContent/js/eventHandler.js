	
	
	var EventHandler = function(info,workplace){
		
		information=$(info)
		
		var that={
			showUser:function(node){
				var name=node.data.screenName
				information.html("<font color='blue'>"+name+"</font>")
			},
			
		}
		
		return that
	}
