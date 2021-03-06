Template.home.rendered = () ->

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
	navs: ->
		Template.instance().navs
	isNavSelected: (index) ->
		Template.instance().currentNavIndex.get() == index
	contentTemplate: ->
		Template.instance().navs[Template.instance().currentNavIndex.get()].contentTemplate
	templateData: ->
		Template.instance().navs[Template.instance().currentNavIndex.get()].templateData

Template.home.events
	'click .m-nav-item': (e, instance) ->
		index = $(e.currentTarget).index()
		instance.currentNavIndex.set(index)

Template.home.onCreated ->
	@currentNavIndex = new ReactiveVar(0)
	navs = [
		icon: 'ion-android-apps'
		label: '我的桌面'
		contentTemplate: 'desktop'
	,
		icon: 'ion-aperture'
		label: '应用中心'
		contentTemplate: 'appsGrid'
		templateData: Apps.find
			userTypes:
				$in: [Meteor.user().type]
			$or: [
				userRoles:
					$exists: false
			,
				userRoles: []
			,
				userRoles:
					$in:
						Meteor.user().roles or []
			]
		.fetch()
	,
		icon: 'ion-link'
		label: '上级云平台'
		contentTemplate: 'links'
	]

	categoriedAppsNavs = AppCategories.find().map (appCategory) ->
		icon: appCategory.icon
		label: appCategory.label
		contentTemplate: 'appsGrid'
		templateData: Apps.find({clientId: {$in: appCategory.apps or []}}).fetch()

	Array.prototype.splice.apply navs, [1, 0].concat categoriedAppsNavs

	@navs = navs.filter (nav) ->
		nav.contentTemplate != 'appsGrid' or nav.templateData.length > 0
