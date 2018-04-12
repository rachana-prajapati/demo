require 'sinatra'
require 'json'
require 'net/http'
require 'net/https'
require 'uri'

set :port, 9000

post '/payload' do
	push = JSON.parse(request.body.read)
	#puts "I got some JSON: #{push.inspect}"
	url = URI.parse('http://services.groupkt.com/country/get/all')
	req = Net::HTTP::Get.new(url.to_s)
	res = Net::HTTP.start(url.host, url.port) {|http|
		http.request(req)
	}
	puts res.body
end