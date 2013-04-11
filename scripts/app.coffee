App = Ember.Application.create()
App.Store = DS.Store.extend
  revision: 12,
  adapter: 'DS.FixtureAdapter'

App.ApplicationRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set('appName2', 'Maklog2')

App.ApplicationController = Ember.Controller.extend
  appName: 'Maklog'
  test:true

App.Router.map ->
  this.resource 'haha', ->
    this.route 'foo'
    this.resource 'about'
    this.resource 'posts', ->
      this.resource 'post',
        path: ':post_id'
App.HahaRoute = Ember.Route.extend
  cry: ->
    'wawawa'
App.HahaController = Ember.Controller.extend
  mom:'Guo'
App.PostsRoute = Ember.Route.extend
  model: ->
    App.Post.find()

App.PostRoute = Ember.Route.extend
  model: (params)->
    App.Post.find(params.post_id)
	
App.PostController = Ember.Controller.extend
  title1:model.get('title')
  author1:model.get('author')
  intro1:model.get('intro')
  description1:model.get('description')
  publishedAt1:model.get('publishedAt')

App.Post = DS.Model.extend
  title: DS.attr('string')
  author: DS.attr('string')
  intro: DS.attr('string')
  description: DS.attr('string')
  publishedAt:DS.attr('date')
App.Post.FIXTURES = [
  id: 1
  title: "Today is good day"
  author: "Lin"
  intro:"Today really a good day, because you are around"
  description: """
  It should be the day before, I was still jerking off in my car, in the middle noon Thursday. There is a old lady who trying to park her car in the block next to me, when I was about to move my luggage in the front row. I thought she is too old to notice the unusual activity was going on, but unfortunitily she does. so they maybe report a suspected car was parking outside the community parking lot and propbly sleeping there for the night.
  """
  publishedAt: new Date(1985,4,14)
,
  id:2
  title:"I'm not happy"
  author:"SheepSheep"
  intro:"Today I'm not happy, because you are not near"
  description: """
  It should be the day before, I was still jerking off in my car, in the middle noon Thursday. There is a old lady who trying to park her car in the block next to me, when I was about to move my luggage in the front row. I thought she is too old to notice the unusual activity was going on, but unfortunitily she does. so they maybe report a suspected car was parking outside the community parking lot and propbly sleeping there for the night.
  """
  publishedAt: new Date(2013,3,9, 10, 21, 54)
]

Em.Handlebars.registerBoundHelper 'date', (date) ->
  moment(date).fromNow()
Em.Handlebars.registerBoundHelper 'markdown', (input) ->
  Em.Handlebars.SafeString(showdown.makeHtml(input))
