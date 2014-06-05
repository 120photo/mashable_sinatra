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
