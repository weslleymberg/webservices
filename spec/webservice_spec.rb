require File.dirname(__FILE__) + '/../webservice.rb'
require 'rack/test'

set :enviorment, :test

def app
    Sinatra::Application
end

describe 'Reverse Service' do
    include Rack::Test::Methods

    it 'should reverse the string you provide it' do
        reverse('weslleym').should == 'myellsew'
        reverse('hello').should == 'olleh'
    end

    it 'should load the home screen' do
        get '/'
        last_response.should be_ok
        last_response.body.should == "Main Page"
    end

    it 'should load a second page' do
        get '/nonereal'
        last_response.status.should == 200
        last_response.body.should == 'Another page'
    end

    it 'should get the body page' do
        get '/hello'
        last_response.should be_ok
        last_response.body.should == 'Hello World'
    end

    it 'should make a post request' do
        post '/reverse', params = {:str => 'weslleymberg'}
        last_response.should be_ok
        last_response.body.should == 'grebmyellsew'
    end
end
