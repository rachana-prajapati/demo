require 'sinatra'
require 'json'
require 'net/http'
require 'net/https'
require 'uri'

set :port, 9000

post '/payload' do
	push = JSON.parse(request.body.read)
	puts "I got some JSON: #{push.inspect}"
	#uri = URI.parse("https://hooks.slack.com/services/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")
	uri = URI.parse("http://services.groupkt.com/country/get/all")
	header = {'Content-Type': 'text/json'}
	# Create the HTTP objects
	http = Net::HTTP.new(uri.host, uri.port)
	request = Net::HTTP::Get.new(uri.request_uri, header)
	#message = {text:'hii'}
	#request.body =  JSON.generate({"text":"hiii"})
	#request.body = message.to_json
	#puts message.to_json
	# Send the request
	response = http.request(request)
	#puts "response: "+response.to_str
	resp = 
end