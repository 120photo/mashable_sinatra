=begin

Sinatra + APIs
==========================

Today we will cover:

* Working with APIs in Postman
* Integrating APIs into Sinatra

Lab + Homework: Mashable Bookmarks
==================================

Use http://mashable.com/stories.json to build a front-end to mashable.

* As a user I can see a list of all new stories
* As a user I can see a thumbnail of each story
* As a user I can filter the stories by category (can be a static list of categories)

Bonus
-----
* As a user I can see tweets relating to an article (use the [Twitter Gem](https://github.com/sferik/twitter))
* As a user I can filter the stories by author (dynamically generated)

=end

require 'sinatra'
require 'rest_client'

# creating variable with content of collection
resp = RestClient.get('http://mashable.com/stories.json?new_per_page=36')
# converting json into somthing Ruby can read
doc = JSON.parse(resp)

# setting up array for categories
cat = []
# parsing through array looking for story's channel
# then pushing categories to cat array
doc['new'].each do |chan|
	cat.push(chan['channel'])
end

stories = doc['new']


get '/' do
	@jumbo = 'Mash Mash2'
    @stories = stories
    @categories = cat.uniq.sort
    erb :home
end

# sorter = []
# doc['new'].each do |c, s|
# 	sorter.push(c['channel']  s['title'])
# end


get '/sort/:categories' do
	sort_array = []
	@stories = stories
	@categories = cat.uniq().sort
	return "here are the #{cat}"
end