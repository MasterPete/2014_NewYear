require 'sinatra'
require 'json'
require 'haml'
require 'sass'
require 'CSV'

set :haml, format: :html5
set :bind, '0.0.0.0'

@@wishes = []

CSV.foreach("#{settings.root}/assets/source.csv") do |row|
	@@wishes << { fullname: row[0], url: row[1], name: row[2], word: row[3]}
end

get '/' do
  @wishes = @@wishes
  haml :index
end

get '/:name' do
  @wishes = @@wishes
  haml :index
end



get '/stylesheets/*.css' do
  content_type 'text/css', charset: 'utf-8'
  filename = params[:splat].first
  sass filename.to_sym, views: "#{settings.root}/assets/stylesheets"
end


