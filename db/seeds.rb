# db/seeds.rb

# Create users
users = [
  {email: 'user1@example.com', password: 'password1', username: 'user1', admin: false},
  {email: 'user2@example.com', password: 'password2', username: 'user2', admin: true}
]

users.each do |user|
  User.create!(user)
end

# Create navbar_base_folders
navbar_base_folders = Array.new(5) do
  NavbarBaseFolder.create!
end

# Create categories
categories = navbar_base_folders.map do |navbar_base_folder|
  Category.create!(navbar_base_folder: navbar_base_folder, has_subcategory: [true, false].sample)
end
