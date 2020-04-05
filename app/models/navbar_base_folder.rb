class NavbarBaseFolder < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_one_attached :banner
  translates :title, :description
  globalize_accessors :locales => [:en, :lo], :attributes => [:title, :description]
end
