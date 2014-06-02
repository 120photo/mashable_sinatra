require 'sinatra'
require 'rest_client'

get '/' do
    resp = RestClient.get('http://mashable.com/stories.json')
    doc = JSON.parse(resp)
    @stories = doc['new']
    cats = []
    erb :home
end
