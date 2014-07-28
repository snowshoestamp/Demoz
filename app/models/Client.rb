class Client  
  def initialize(app_key, app_secret)
    BASE_URL = "http://beta.snowshoestamp.com/api/v2/"  
    # Instance variables
    @app_key = app_key  
    @app_secret = app_secret  
  end

  def whatsmysecret
    puts "I am of #{@app_key} breed and my name is #{@app_secret}" 
  end
end 