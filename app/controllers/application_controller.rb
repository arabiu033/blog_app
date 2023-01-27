class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :success
  def create_user
    User.first
  end
end
