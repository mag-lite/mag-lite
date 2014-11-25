class Video < ActiveRecord::Base

  belongs_to :lesson
  belongs_to :author, :class_name => 'User'

  attr_accessible :url, :length

  validates_presence_of :url, :author, :lesson
  validates_numericality_of :length, :greater_than => 0

  def length=(seconds)
    self.length_ms = seconds * 1000.0
  end

  def length
    self.length_ms / 1000.0
  end

  # Format the length in a human-readable String, like "6:03"
  def human_length
    "%d:%02d" % [length.to_i / 60, length.to_i % 60]
  end

end
