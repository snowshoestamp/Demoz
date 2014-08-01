require 'Client'
# include Client

class DemosController < ApplicationController
  def index
  	@demos = Demo.all
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

    @callback_url = "http://10.99.114.161/:3000/stamp_info"
    @data = {"data" => params["data"]}

    @consumer = OAuth::Consumer.new(
      client.app_key, 
      client.app_secret, 
      {:site => "http://beta.snowshoestamp.com/api",
      :scheme => :header
      })
    # Get Auth key with consumer
    @resp = @consumer.request(:post, '/v2/stamp', nil, {}, @data, { 'Content-Type' => 'application/x-www-form-urlencoded' })

    # Parse response and send to template
    @response = JSON.parse(@resp.body)
    if @response["stamp"]["serial"].include? "B"
      @display = "B"
    else 
      @display = "A"
    end

  end

  def errors
    #TODO: send error
  end

  private

  def demo_params
  	params.require(:demo).permit(:stamp_serial)
  end 
end
