class Admin::LessonsController < Admin::ApplicationController

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new(params[:lesson])
  end

  def create
    @lesson = Lesson.new(params[:lesson])

    if @lesson.save
      redirect_to admin_lesson_path(@lesson), :notice => 'Lesson created'
    else
      render :action => :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])

    if @lesson.update_attributes(params[:lesson])
      redirect_to admin_lesson_path(@lesson), :notice => 'Lesson updated'
    else
      render :action => :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])

    if @lesson.destroy
      redirect_to admin_lessons_path, :notice => 'Lesson deleted'
    else
      render :action => :show
    end
  end
end
