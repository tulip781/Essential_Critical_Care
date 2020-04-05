class SecretNavbarBaseFolder < ApplicationRecord
  has_many :secret_categories
  has_one_attached :banner
end
