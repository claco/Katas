class HelloController < ApplicationController
  def index
    @greeting = params[:greeting] ? params[:greeting] : 'world'
  end
end
