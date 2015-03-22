require 'sinatra'
require 'rest_client'
require 'json'

# creating variable with content of collection
resp = RestClient.get('http://mashable.com/stories.json?new_per_page=60')
# converting json into somthing Ruby can read
doc = JSON.parse(resp)

# setting up array for categories
categories = []
# parsing through array looking for story's channel
# then pushing categories to cat array
doc['new'].each do |chan|
  categories.push(chan['channel'])
end

stories = doc['new']


get '/' do
  @jumbo = 'Mash Mash2'
  @stories = stories
  @categories = categories.uniq.sort
  erb :home
end

# sorter = []
# doc['new'].each do |c, s|
#   sorter.push(c['channel']  s['title'])
# end


get '/sort/:categories' do
  sort_array = []
  @stories = stories
  @categories = categories.uniq().sort
  return "here are the #{categories}"
end
