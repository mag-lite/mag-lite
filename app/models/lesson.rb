class Lesson < ActiveRecord::Base

  belongs_to :uploader, :class_name => "User"

  has_many :videos, :dependent => :destroy
  has_one :current_video, :order => "videos.id DESC", :class_name => "Video"

  attr_accessible :name, :description, :display_order, :published

  validates_presence_of :name, :description
  validates_uniqueness_of :display_order, :if => :published?
  validates_numericality_of :display_order, :greater_than => 0, :if => :published?
true
  scope :published, where(:published => true)
  scope :ordered, order("`#{self.table_name}`.`display_order` ASC")

  # Filter this relation to find records that can be viewed by a group
  #
  # user_group - User::Group to filter the lessons by
  #
  # Returns the filtered relation
  def self.viewable_by(user_group)
    if user_group.admin?
      self
    else
      self.published
    end
  end

  def next_lesson(lessons)
    lessons.ordered.where(['display_order > ?', display_order]).first
  end

end
