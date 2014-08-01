gem 'oauth'
require 'oauth'
require 'net/http'

class Client 
  attr_reader :app_key, :app_secret

  def initialize(app_key, app_secret)
    @base_url = "http://beta.snowshoestamp.com/api/v2/"  
    # Instance variables
    @app_key = app_key  
    @app_secret = app_secret
  end

  def whatsmysecret
    puts "I am of #{@app_key} breed and my name is #{@app_secret}" 
  end
end 