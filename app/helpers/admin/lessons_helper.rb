module Admin::LessonsHelper

  def lesson_status_label(lesson)
    if lesson.published?
      content_tag :span, 'published', :class => 'label label-success'
    else
      content_tag :span, 'draft', :class => 'label label-default'
    end
  end

end
