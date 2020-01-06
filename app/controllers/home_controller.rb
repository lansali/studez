require "ostruct"

class HomeController < ApplicationController
  include HomeHelper
  skip_before_action :authenticate_request

  def index
    set_homepage_data
  end

  private
    # Use callbacks to share common setup or constraints between actions.
end
