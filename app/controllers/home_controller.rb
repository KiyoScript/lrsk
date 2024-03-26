class HomeController < ApplicationController
  include StaffAccessible
  def index
    @brgy_tambulilid  = Patient.where(details_address: 'Brgy. tambulilid')
  end
end
