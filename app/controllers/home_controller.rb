class HomeController < ApplicationController
  def index
    @dream = Dream.new
    @dreams = Dream.published.limit(3).sample(3)
  end
end
