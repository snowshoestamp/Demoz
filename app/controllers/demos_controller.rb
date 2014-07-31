require 'Client'
# include Client

class DemosController < ApplicationController
  def index
  	@demos = Demo.all
    # binding.pry
  end

  def new
  	@demo = Demo.new
  end

  def create
    @demo = Demo.new(demo_params)
    if @demo.save
    	#CHANGE REDIRECT_TO STAMP SCREEN URL
      redirect_to demos_path
    else
      render action: "new"
    end
  end

  def edit
  end

  def callback
    client = Client.new('5bc9c3ddf1f46265e03a', '70a99aa7f4de7f48f235215ce2708b6e4f19377c')
    # @response = client.processData(params["data"])

    @callback_url = "http://10.99.114.161/:3000/stamp_info"

    @consumer = OAuth::Consumer.new(
      client.app_key, 
      client.app_secret, 
      :site => "http://beta.snowshoestamp.com/api/v2/stamp"
      # :authorize_url => 
    )
    
    @request_token = @consumer.get_request_token(:oauth_callback => @callback_url)
    @request_token.params = params
    # @request_token.secret = client.app_secret
    session[:request_token] = @request_token
    binding.pry
    redirect_to @request_token.authorize_url(:oauth_callback => @callback_url)
  end

  private

  def demo_params
  	params.require(:demo).permit(:stamp_serial)
  end 
end
