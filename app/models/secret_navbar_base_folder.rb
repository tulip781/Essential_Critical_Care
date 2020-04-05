class SecretNavbarBaseFolder < ApplicationRecord
  has_many :secret_categories
  has_one_attached :banner
  translates :title, :description
  globalize_accessors :locales => [:en, :lo], :attributes => [:title, :description]
end
