class WelcomeController < ApplicationController
  def index
  end
  def error
    @message = params[:message]
  end
end
