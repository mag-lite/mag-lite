class User::Group

  USER_SLUG   = :user
  ADMIN_SLUG  = :admin
  VALID_SLUGS = [USER_SLUG, ADMIN_SLUG]

  attr_reader :slug

  def initialize(slug)
    @slug = slug.to_sym

    unless VALID_SLUGS.include? @slug
      raise ArgumentError.new "Unknown User::Group slug #{slug}"
    end
  end

  VALID_SLUGS.each do |slug|
    define_method "#{slug}?" do
      self.slug == slug
    end
  end
end
