class SessionsController < ApplicationController
  
  # GET /login
  def new
    @session = Session.new
  end

  # POST /login
  def create
    @session = Session.new(params[:session])

    if @session.valid?
      self.current_user = @session.user
      redirect_to lessons_path
    else
      render :action => :new
    end
  end

  # GET /logout
  def destroy
    self.current_user = nil
    redirect_to login_path, :notice => "You have been signed out."
  end


end
