class UserController < ApplicationController
  CLIENT_ID = "34c53dab4920c44f4c51"
  CLIENT_SECRET = "e772d5f5700c17720960ce56075053f31d961dfa"

  DEBUG_MODE = true
  ACCESS_TOKEN = "f9af1b89345bd0bda7b9f5dcbf8e6da7dcd4f224"

  def new
  end

  def callback

    require "net/http"

    if DEBUG_MODE != true

      code = params[:code]
      data = {:client_id => CLIENT_ID, :client_secret => CLIENT_SECRET, :code => code }

      url = URI.parse("https://github.com/login/oauth/access_token")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(url.path, {'Content-Type' =>'application/json'})
      request.body = data.to_json
      response = http.request(request)
      token_string = response.body.split("&").at(0)
      if !token_string.starts_with? "access_token"
      	render plain: "error"
      end

    end
     
    # access_token = DEBUG_MODE == true ? ACCESS_TOKEN : token_string.split("=").at(1)
    # url = URI.parse("https://api.github.com/user?access_token=#{access_token}")
    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true

    # response = http.start() {|http| http.get(url.request_uri)}

    # user_json = ActiveSupport::JSON.decode response.body

    # @user = User.new
    # @user.name = user_json["login"]
    # @user.avatar_url = user_json["avatar_url"]

    @user = User.new
    @user.name = "crispgm"
    @user.avatar_url = "https://avatars.githubusercontent.com/u/1425636?v=3"

    render "user/callback"
    
  end
end
