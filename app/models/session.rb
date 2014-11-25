
class Session

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :user, :password, :email
    
  validates_presence_of :password
  validates_each :user do |record, attr, value|
    if value
      record.errors.add(:base, :authentication_failed) unless value.authenticate(record.password)
    else
      record.errors.add(:base, :user_is_blank)
    end
  end

  # attrs - Hash of params for initializing this session's User and password
  #         :email    - the User's email address
  #         :password - the User's password
  #
  # Example:
  #
  #    Session.new(:email => 'joesixpack@gmail.com', :password => 'p@ssw0rd')
  def initialize(attrs={})
    self.email    = attrs[:email]
    self.password = attrs[:password]
  end

  def email=(email)
    @email = email
    self.user = User.where(:email => email).first
  end

  def persisted?
    false
  end

end
