require 'sinatra'
require 'rest_client'

get '/' do
    resp = RestClient.get('http://mashable.com/stories.json')
    doc = JSON.parse(resp)
    @stories = doc['new']
    cat = []
    doc['new'].each do |chan|
    	cat.push(chan['channel'])
    end
    @categories = cat.uniq
    erb :home
end
