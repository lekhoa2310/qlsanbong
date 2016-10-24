class User < ActiveRecord::Base
  before_save :hash_password
  validates :name, presence:true
  validates :address, presence:true
  validates :phone, presence: true, uniqueness:true
  validates :email, presence:true, uniqueness:true
  validates :password, presence:true, length: {minimum:6}, confirmation: true
  self.per_page = 3
  def hash_password
    self.password = Digest::MD5::hexdigest(self.password)

  end

  def authenticate(password)
    password_hash = Digest::MD5::hexdigest(password)
    return true if password_hash == self.password
    return false
  end

  def is_admin
    if self.role == 1
      return true
    else
      return false
    end
  end

  def is_user
    if self.role == 0
      return true
    else
      return false
    end
  end
end
