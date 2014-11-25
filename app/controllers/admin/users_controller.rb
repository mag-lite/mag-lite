class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.ordered.all
  end

end
