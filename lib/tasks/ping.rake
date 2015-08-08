require 'net/http'

desc 'Ping URL'
task :ping, :url do |t, args|
  url = args[:url]
  url ||= 'signalexception.com'
  puts "Pinging #{url}..."
  r = Net::HTTP.new(url, 80).request_head('/')
  puts "Response Received: [#{r.code}] #{r.message}"
end
