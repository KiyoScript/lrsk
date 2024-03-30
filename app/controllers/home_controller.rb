class HomeController < ApplicationController
  include StaffAccessible
  def index;end
end
