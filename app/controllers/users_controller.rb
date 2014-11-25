class UsersController < ApplicationController

  # GET /profile
  def show
    @user = current_user
  end

  # GET /profile/edit
  def edit
    @user = current_user
  end

  # PUT /profile
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to user_path, notice: "Your profile was updated"
    else
      render action: :edit
    end
  end

end
