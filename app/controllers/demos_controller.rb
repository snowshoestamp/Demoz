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

  def callback(request)
    @client = Client.new("abcde", 12345)
    binding.pry
    data = request.body
    # data = $_POST[‘data’]
  end

  private

  def demo_params
  	params.require(:demo).permit(:stamp_serial)
  end 
end
