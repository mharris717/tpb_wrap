def get_cached_body(url)
  require 'open-uri'
  require 'json'
  cache_url = "http://pagecache.herokuapp.com/addresses/ignore.json?url=#{url}&max_age=9999"
  res = open(cache_url).read
  res = JSON::load(res)
  res['body']
end