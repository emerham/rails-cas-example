class LoginController < ApplicationController
  before_filter CAS::Filter
  before_filter CASClient::Frameworks::Rails::Filter
  def index
  end

end
