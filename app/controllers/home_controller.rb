class HomeController < ApplicationController
  def index
    @dream = Dream.new
    @dreams = Dream.all.sample(3)
  end
end
