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
    @response = client.processData(params["data"])
    # binding.pry
    # @data = request.body
    # puts @response
  end

  private

  def demo_params
  	params.require(:demo).permit(:stamp_serial)
  end 
end
