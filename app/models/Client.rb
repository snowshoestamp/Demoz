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
    # session[:request_token] = nil
  end

  # def processData(data)
  #   @callback_url = "http://10.99.114.161/:3000/stamp_info"
  #   @consumer = OAuth::Consumer.new(@app_key, @app_secret, :site => "http://beta.snowshoestamp.com/api/v2/")
  #   @request_token = @consumer.get_request_token(:oauth_callback => @callback_url)
  #   session[:request_token] = @request_token
  #   redirect_to @request_token.authorize_url(:oauth_callback => @callback_url)
  #   @request_token
  # end

  def whatsmysecret
    puts "I am of #{@app_key} breed and my name is #{@app_secret}" 
  end
end 