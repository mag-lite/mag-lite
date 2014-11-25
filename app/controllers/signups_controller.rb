class SignupsController < ApplicationController

  # GET /subscribe
  def new
    @user = build_user
  end

  # POST /subscribe
  def create
    @user = build_user

    if @user.save
      self.current_user = @user
      redirect_to lessons_path
    else
      render :action => :new
    end
  end

  protected

  def build_user
    User.new(params[:user])
  end

end
