def token
  "F0B582CP"
end

class PutioApi
  include FromHash
  attr_accessor :access_token
  
  def url(sub)
    require 'open-uri'
    url = "https://api.put.io/v2/#{sub}?oauth_token=#{access_token}"
    puts "getting #{url}"
    url
  end
  
  def get(sub)
    json = open(url(sub)).read
    JSON.parse(json)
  end
  
  def post(sub,data={})
    #sess = Patron::Session.new
    #sess.timeout = 10
    #sess.base_url = "https://api.put.io/v2"
    #sess.headers['User-Agent'] = 'myapp/1.0'
    #sess.enable_debug "/tmp/patron.debug"
    
    require 'net/http'
    
    #uri = URI(url(sub))
    #res = Net::HTTP.post_form(uri, data)
    #puts res.body
    
    #sess.post url(sub), data
    
    uri = URI(url(sub))
    req = Net::HTTP::Post.new(uri.path)
    data['oauth_token'] = access_token
    req.set_form_data(data)

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) do |http|
      puts http.request(req)
    end
  end
  
  def files
    get "files/list"
  end
  
  def upload(file)
    post "transfers/add", :url => file
  end
  
  class << self
    def test
      user = User.first
      api = new(:access_token => user.access_token)
      require 'pp'
      pp api.files
    end
  end
end

#require 'patron'

def add_to_putio!(name)
  magnet = TpbWrap.magnet_url(name)
  puts "Magnet: #{magnet}"

  api = PutioApi.new(:access_token => token)
  api.upload magnet
end

(0...6).each { |x| puts "" }
add_to_putio! "orphanage"

