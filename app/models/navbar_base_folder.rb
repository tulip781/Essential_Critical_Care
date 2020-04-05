class NavbarBaseFolder < ApplicationRecord
  has_many :categories, dependent: :destroy
end
