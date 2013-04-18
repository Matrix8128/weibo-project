//
//  main.js
//
//  A project template for using arbor.js
//

Visualization = function(workplace, canvasId, data) {
	
	var canvas = $(canvasId).get(0)
	
	var sys = arbor.ParticleSystem(1000, 600, 0.5) // create the system with
													// sensible
													// repulsion/stiffness/friction
	sys.parameters({
		gravity : false
	}) // use center-gravity to make the graph settle nicely (ymmv)
	sys.parameters({stiffness:1000, repulsion:500, gravity:true, dt:0.015})
	sys.renderer = Renderer(canvasId) // our newly created renderer will have
									// its .init() method called shortly by
										// sys...

	var that = {
		
		init : function() {
		
			$(window).resize(that.resize)

			canvas.width =  $(workplace).width()
			canvas.height = $(workplace).height()
			sys.screenSize(canvas.width, canvas.height)
			//sys.renderer.redraw() //第一次不能用sys.renderer.redraw()，否则实验表明，会死循环一直redraw下去
			
			that.handleData(data)
			
			return that
		},
		resize : function() {
			var w = $(workplace).width()
			var h = $(workplace).height()
			canvas.width = w
			canvas.height = h
			sys.screenSize(w, h)
			sys.renderer.redraw()
		},
		handleData	:	function(data){
			
			//edgeColor="rgba(255,255,255,.5)"
			nodesData={}
			edgesData={}
			
			nodesData[data.name]={mass:6,fixed:true,color:"red",type:"centre"}
			edgesData[data.name]={}
			
			$.each(data.biFriends,function(index,user){
				nodesData[user.name]={mass:3,color:"green",type:"bi",alpha:1}
				edgesData[data.name][user.name]={length:.1}
			})
			
			$.each(data.uniFriends,function(index,user){
				nodesData[user.name]={mass:1,color:"blue",type:"uni",alpha:1}
				edgesData[data.name][user.name]={length:.9}
			})
			
			sys.graft({nodes:nodesData,edges:edgesData})
			
			//sys.merge({nodes:nodesData,edges:edgesData})
			/*
			sys.addEdge('a', 'b')
			sys.addEdge('a', 'c')
			sys.addEdge('a', 'd')
			sys.addEdge('a', 'e')
			sys.addNode('f', {
				alone : true,
				mass : 5.0
			})*/
		}
		
		
	}
	return that.init()
}
