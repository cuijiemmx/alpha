Template.home.rendered = () ->
	w = new WOW().init()

	# TODO: End after home destroyed

	# make sure div stays full width/height on resize
	# global vars
	winWidth = $(window).width()
	winHeight = $(window).height()

	# set initial div height / width
	$("#intro").css
	  width: winWidth
	  height: winHeight

	$(window).resize ->
	  $("#intro").css
	    width: $(window).width()
	    height: $(window).height()

	#Skroll doesn't work so well on mobile imo
	unless Utils.isMobile
		options =
			forceHeight: false
			smoothScrolling: false

		skrollr.init(options).refresh()

Template.home.destroyed = () ->
	#For Skrollr
	$('body').attr('style','')


Template.home.helpers
	times: [1,1,1,1,1,1,1,1,1,1,1,1]
	navs: ->
		Template.instance().navs
	isNavSelected: (index) ->
		Template.instance().currentNavIndex.get() == index
	contentTemplate: ->
		Template.instance().navs[Template.instance().currentNavIndex.get()].contentTemplate


Template.home.events
	'click .m-nav-item': (e, instance) ->
		index = $(e.target).index()
		instance.currentNavIndex.set(index)

Template.home.onCreated ->
	this.currentNavIndex = new ReactiveVar(0)
	this.navs = [
			icon: 'ion-android-apps'
			label: '我的桌面'
			contentTemplate: 'noData'
		,
			icon: 'ion-aperture'
			label: '应用中心'
			contentTemplate: 'notFound'
		,
			icon: 'ion-link'
			label: '上级云平台'
			contentTemplate: 'links'
	]
