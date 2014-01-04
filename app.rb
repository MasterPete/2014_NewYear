require 'sinatra'
require 'json'
require 'haml'
require 'sass'

set :haml, format: :html5
set :bind, '0.0.0.0'

@@wishes = [
{ name: "petec", fullname: "Pete C"},
{ name: "liviu", fullname: "Liviu, Bog, and family", word: "Thanks for putting up with me in 2013, guys - it was a blast! Wish you and your family a fantastic 2014 and looking forward to see you again soon!" }
]


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


