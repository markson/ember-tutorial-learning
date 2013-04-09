App = Ember.Application.create()
App.Store = DS.Store.extend
	revision: 12,
	adapter: 'DS.FixtureAdapter'
App.Router.map ->
	this.resource 'about'
	this.resource 'posts', ->
		this.resource 'post',
			path: 'post_id'
App.PostsRoute = Ember.Route.extend
	model: ->
		App.Post.find()
App.Post = DS.Model.extend
	title: DS.attr('string')
	author: DS.attr('string')
	description: DS.attr('string')
	publishedAt:DS.attr('date')
App.Post.FIXTURES = [
	id: 1
	title: "Today is good day"
	author: "Lin"
	intro:"Today really a good day, because you are around"
	description:"""
	It should be the day before, I was still jerking off in my car, in the middle noon Thursday. There is a old lady who trying to park her car in the block next to me, when I was about to move my luggage in the front row. I thought she is too old to notice the unusual activity was going on, but unfortunitily she does. so they maybe report a suspected car was parking outside the community parking lot and propbly sleeping there for the night.
	"""
	publishedAt: new Date('4-14-1985')
,
	id:2
	title:"I'm not happy"
	author:"SheepSheep"
	intro:"Today I'm not happy, because you are not near"
	description:"""
	It should be the day before, I was still jerking off in my car, in the middle noon Thursday. There is a old lady who trying to park her car in the block next to me, when I was about to move my luggage in the front row. I thought she is too old to notice the unusual activity was going on, but unfortunitily she does. so they maybe report a suspected car was parking outside the community parking lot and propbly sleeping there for the night.
	"""
	publishedAt: new Date('10-19-1984')
]
