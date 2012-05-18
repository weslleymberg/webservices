require 'rubygems'
require 'sinatra'

def reverse string
    string.each_char.to_a.reverse.join
end

get '/' do
    'Main Page'
end

get '/nonereal' do
    'Another page'
end

get '/hello' do
    'Hello World'
end

post '/reverse' do
    reverse params[:str]
end
