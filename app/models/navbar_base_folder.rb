class NavbarBaseFolder < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_one_attached :banner
end
