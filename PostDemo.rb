require 'sinatra'
require 'json'
require 'net/https'
require 'uri'
require 'openssl'

set :port, 9000

#CERT_PATH = 'C:\Ruby23\lib\ruby\site_ruby\2.3.0\rubygems\ssl_certs'

post '/payload' do
	push = JSON.parse(request.body.read)
	#puts "I got some JSON: #{push.inspect}"
	#uri = URI.parse("https://hooks.slack.com/services/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")
	uri = URI.parse('https://jsonplaceholder.typicode.com/posts')
	header = {'Content-Type': 'application/json'}
	
	# Create the HTTP objects
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_PEER
	cert = OpenSSL::X509::Certificate.new(File.read('C:\Ruby23\lib\ruby\site_ruby\2.3.0\rubygems\ssl_certs\GlobalSignRootCA.pem'))
	http.cert_store.add_cert(cert)	
	
	request = Net::HTTP::Post.new(uri.request_uri, header)
	message = {title:'rach',body:'There is a garden!!',userId:2}
	#request.body =  JSON.generate({"text":"hiii"})
	request.body = message.to_json
	puts message.to_json
	# Send the request
	response = http.request(request)
	#puts "response: "+response.to_str
	puts response.body 
end