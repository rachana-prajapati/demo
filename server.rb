require 'sinatra'
require 'json'
require 'net/http'
require 'uri'

set :port, 9000

post '/payload' do
	push = JSON.parse(request.body.read)
	puts "I got some JSON: #{push.inspect}"
	uri = URI.parse("https://hooks.slack.com/services/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")
	header = {'Content-Type': 'text/json'}
	# Create the HTTP objects
	http = Net::HTTP.new(uri.host, uri.port)
	request = Net::HTTP::Post.new(uri.request_uri, header)
	request.body =  JSON.generate({"text":"hiii"})
	
	# Send the request
	response = http.request(request)
	#puts "response: "+response.to_str
	puts "message sent to the bot.."
end
