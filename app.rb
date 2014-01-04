require 'sinatra'
require 'json'
require 'haml'
require 'sass'

set :haml, format: :html5
set :bind, '0.0.0.0'

@@offers = [
{ name: "Traditional Value Range Pizzas", price: "9.99", day: "Today Only", featured: "Featured Offer" },
{ name: "3 Traditional Pizzas + 2 Garlic Breads + 2 x 1.25L Drinks", price: "9.99", day: "Today Only" },
{ name: "Value Range Pizzas", price: "11.95", day: "Last Day" },
{ name: "Traditional Value Range Pizzas", price: "9.99", day: "9 Days Left" }
]



get '/' do
  haml :index
end


get '/stylesheets/*.css' do
  content_type 'text/css', charset: 'utf-8'
  filename = params[:splat].first
  sass filename.to_sym, views: "#{settings.root}/assets/stylesheets"
end


