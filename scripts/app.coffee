App = Ember.Application.create()
App.Store = DS.Store.extend
	revision: 12,
	adapter: 'DS.FixtureAdapter'
App.Router.map ->
	this.resource('about')
App.Post = DS.Model.extend
	title: DS.attr('string')
	description: DS.attr('string')
	publishedAt:DS.attr('date')
App.Post.FIXTURES = [
	id: 1
	title: "Today is good day"
	description:"Today really a good day, because you are around"
	publishedAt: new Date('4-14-1985')
,
	id:2
	title:"I'm not happy"
	description:"Today I'm not happy, because you are not near"
	publishedAt: new Date('10-19-1984')
]
