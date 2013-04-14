App = Ember.Application.create
  LOG_TRANSITIONS: true

App.Store = DS.Store.extend
  revision: 12,
  adapter: 'DS.FixtureAdapter'

App.ApplicationRoute = Ember.Route.extend
  setupController: (controller)->
    controller.set('appName2', 'Maklog2')


App.ApplicationController = Ember.Controller.extend
  appName: 'Maklog'
  


App.Router.map ->
  this.resource 'about'
  this.resource 'posts', ->
    this.resource 'post', {path: ':post_id'}

App.PostsRoute = Ember.Route.extend
  model: ->
    App.Post.find()
# App.PostRoute = Ember.Route.extend
#   model: ->
#     App.Post.find(params.post_id)

App.PostController = Ember.Controller.extend
  edit: ->
    this.set('isEditing', true)
  doneEditing: ->
    this.set('isEditing', false)

	

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
  intro:"Today really a *good day*, because you are around"
  description: """
  It should be **the day** before, I was still jerking off in my car, in the middle noon Thursday. There is a old lady who trying to park her car in the block next to me, when I was about to move my luggage in the front row. I thought she is too old to notice the unusual activity was going on, but unfortunitily she does. so they maybe report a suspected car was parking outside the community parking lot and propbly sleeping there for the night.
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
showdown = new Showdown.converter()
Em.Handlebars.registerBoundHelper 'markdown', (input) ->
  new Em.Handlebars.SafeString(showdown.makeHtml(input))
Em.Handlebars.registerBoundHelper 'highlight', (input) ->
  new Em.Handlebars.SafeString("<span class='highlight'>#{input}</span>")
