class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_writer :login
  devise :database_authenticatable, :authentication_keys => [:username]
  validates :username, uniqueness: true

  def login
    @login || self.username || self.email
  end
end
