class User < ApplicationRecord
  include Shield::Model

  def self.fetch(email)
    find_by(email: email)
  end

  def self.register(args)
    new_obj = new

    new_obj.email = args[:email]
    new_obj.password = args[:password]

    if Shield::Password.check(args[:password_confirmation], new_obj.crypted_password)
      new_obj.save!
    end
  end
end
