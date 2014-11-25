class User < ActiveRecord::Base

  validates :email, :presence => true, :email => {:mx => true}
  validates_uniqueness_of :email
  
  validates :password, :length => {:in => 6..30}, :on => :create
  validates :password, :length => {:in => 6..30}, :allow_blank => true, :on => :update
  validates_numericality_of :target_score, :actual_score, only_integer: true, greater_than: 0, allow_blank: true

  attr_accessible :email, :password, :name, :heard_from, :target_score, :actual_score

  scope :ordered, order("`#{self.table_name}`.`created_at` DESC")

  def authenticate(unencrypted_password)
    if unencrypted_password.blank?
      return false
    else
      acceptable_passwords = [unencrypted_password]
      # Allow password if the user accidentally had caps lock on
      acceptable_passwords << unencrypted_password.swapcase
      # Allow password if first character was capitalized (common phone keyboard error)
      acceptable_passwords << unencrypted_password.chr.swapcase + unencrypted_password[1..-1].to_s
    
      success = acceptable_passwords.any? do |word|
        User::Authentication.encrypt_password(word, salt) == self.password_digest
      end
      return (success && self)
    end
  end

  def password
    @password
  end

  def password=(unencrypted_password)
    unless unencrypted_password.blank?
      @password = unencrypted_password

      self.salt            = User::Authentication.make_token
      self.password_digest = User::Authentication.encrypt_password(unencrypted_password, self.salt)
    end
  end

  def group
    User::Group.new(self.group_slug)
  end

  def group=(user_group)
    self.user_group
  end

end
