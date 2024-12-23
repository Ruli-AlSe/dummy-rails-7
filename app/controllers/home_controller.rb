class HomeController < ApplicationController
  def index
    @name = "Raul"
    @skills = ["Ruby", "Rails", "Javascript", "React"]
  end
end