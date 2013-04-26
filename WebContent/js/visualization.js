//
//  main.js
//
//  A project template for using arbor.js
//

Visualization = function(info,workplace, canvasId, data) {
	var canvas = $(canvasId).get(0)
	
	var sys = arbor.ParticleSystem(1000, 600, 0.5) // create the system with
													// sensible
													// repulsion/stiffness/friction
	sys.parameters({
		gravity : false
	}) // use center-gravity to make the graph settle nicely (ymmv)
	sys.parameters({stiffness:1000, repulsion:500, gravity:true, dt:0.015})
	//sys.parameters({stiffness:4000,repulsion:200,Friction:9,graviey:true,fps:30,dt:.035,precision:.6})

	var eventHandler=EventHandler(info,workplace)
	sys.renderer = Renderer(canvasId,eventHandler) // our newly created renderer will have
									// its .init() method called shortly by
										// sys...

	var that = {
		
		init : function() {
		
			$(window).resize(that.resize)

			canvas.width =  $(workplace).width()
			canvas.height = $(workplace).height()
			sys.screenSize(canvas.width, canvas.height)
			//sys.renderer.redraw() //��һ�β�����sys.renderer.redraw()������ʵ�����������ѭ��һֱredraw��ȥ
			
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
			
			nodesData[data.id]={mass:6,fixed:true,color:"red",type:"centre",screenName:data.name
								,head:data.head}
			edgesData[data.id]={}
			
			$.each(data.biFriends,function(index,user){
				nodesData[user.id]={mass:3,color:"green",type:"bi",alpha:1,screenName:user.name
									,head:user.head}
				edgesData[data.id][user.id]={length:.1}
			})
			
			$.each(data.uniFriends,function(index,user){
				nodesData[user.id]={mass:1,color:"blue",type:"uni",alpha:1,screenName:user.name
									,head:user.head}
				edgesData[data.id][user.id]={length:.9}
			})

			sys.graft({nodes:nodesData,edges:edgesData})

		}
		
		
	}
	return that.init()
}
