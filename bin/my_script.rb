require 'addressable/uri'
require 'rest-client'

# bin/my_script.rb
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/1.html',
  
  query_values: {
    'user[name]' => 'Charles',
    'user[email]' => 'clarkkent324@gmail.com'
  }
).to_s

# puts RestClient.post(url, 'user'  =>  {name: "Vader", email: "dvader@gmail.com"})
# puts

RestClient.patch(url, 'user[name]' => 'Charles',
    'user[email]' => 'clarkkent324@gmail.com')
# puts RestClient.get(url)
RestClient.delete(url)

#
RestClient.show(url)