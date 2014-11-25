module User::Authentication


  # Generate a random 40-character hexadecimal string with 160 bits of entropy
  def self.make_token
    secure_digest(Time.now, (1..10).map{ rand.to_s })
  end

  # Encrypts a password with a salt and pepper (which is REST_AUTH_SITE_KEY)
  #
  # REST_AUTH_SITE_KEY and REST_AUTH_DIGEST_STRETCHES are defined in
  # `config/initializers/site_keys.rb`
  #
  # options takes the following options
  #   :scheme
  #     when :method is :md5, uses a single md5 hash to digest the password, :secure uses the restful authorization digest scheme.
  #     :secure is the default, and should be used unless there is a good reason not to (i.e. 3rd party API integration)
  def self.encrypt_password(password, salt, options={})
    digest = REST_AUTH_SITE_KEY
    REST_AUTH_DIGEST_STRETCHES.times do
      digest = secure_digest(digest, salt, password, REST_AUTH_SITE_KEY)
    end
    return digest
  end

  # Digests args into a 40-character string
  def self.secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end
end
