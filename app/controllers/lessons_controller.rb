class LessonsController < ApplicationController

  before_filter :login_required

  def index
    @lessons = collection.all
  end

  def show
    @lesson = collection.find(params[:id])
  end

  protected

  def collection
    Lesson.viewable_by(current_user.group)
  end
  helper_method :collection

end
