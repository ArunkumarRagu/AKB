class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  around_action :set_current_user

  def set_current_user
    User.current = current_user
    yield
  rescue Exception => e
    raise e
  ensure
    User.current = nil
  end
end
