class LoginController < ApplicationController
  before_filter CAS::Filter
  def index
    redirect_to('/')
  end
end
