require 'rubygems'
require 'sinatra'
require 'digest/md5'

FOUNDERS = "{\"Apple\": [\"Steve Jobs\",\"Steve Wozniak\",\"Ronald Wayne\"],\"Dribbble\":[\"Dan Cederholm\",\"Rich Thornett\"],\"GitHub\":[\"Tom Preston-Werner\",\"Chris Wanstrath\",\"PJ Hyett\"],\"Heroku\":[\"James Lindenbaum\",\"Adam Wiggins\",\"Orion Henry\"],\"Gowalla\":[\"Josh Williams\",\"Scott Raymond\"],\"Square\":[\"Jack Dorsey\",\"Tristan O'Tierney\",\"Jim McKelvey\"],\"Twitter\":[\"Jack Dorsey\",\"Biz Stone\",\"Evan Williams\"]}"

get '/' do
  unless params["cache"].nil?
    cache_control :public, :max_age => 30
    expires 30, :public
  end

  unless params["etag"].nil?
    etag Digest::MD5.hexdigest(FOUNDERS)
  end

  FOUNDERS
end
