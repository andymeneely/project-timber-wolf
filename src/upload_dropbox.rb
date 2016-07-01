require 'dropbox_sdk'
require 'pp'

# To obtain a request token:
# Create an App and generate an access token from the web. Copy it into Travis' Environment variables. Make sure that doesn't get echoed to the console.
# https://www.dropbox.com/developers/reference/oauth-guide
# and
# https://www.dropbox.com/developers-v1/core/docs#request-token

def access_token
  if ENV.key? 'DROPBOX_ACCESS_TOKEN'
    return ENV['DROPBOX_ACCESS_TOKEN']
  else
    raise 'Need token in DROPBOX_ACCESS_TOKEN environment variable'
  end
end

puts '--- Connecting to Dropbox ---'
client = DropboxClient.new(access_token)

puts '--- Uploading Files ---'
Dir['_output/*.pdf'].each do |pdf|
dropbox_file = "/Your Last Heist Builds/#{File.basename(pdf)}"
response = client.put_file(dropbox_file, open(pdf))
pp "  uploaded:", response.inspect
end
puts '--- Done Uploading Files ---'
