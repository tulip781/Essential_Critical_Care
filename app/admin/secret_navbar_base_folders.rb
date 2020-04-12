ActiveAdmin.register SecretNavbarBaseFolder, as: "Hidden Topic" do

  menu parent: "Hidden Resources", priority: 0
  actions :all, except: [:new, :create, :destroy]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description
  #
  permit_params *SecretNavbarBaseFolder.globalize_attribute_names, :banner

  form do |f|
  f.semantic_errors # shows errors on :base
  f.inputs          # builds an input field for every attribute
  f.inputs "Upload the photo you want as the section banner" do
    f.input "banner", label: "Banner", as: :file, input_html: { direct_upload: true }
  end
  I18n.available_locales.each do |locale|
    f.inputs " #{locale == :en ? 'Secret Navbar - English Translation ' : 'Secret Navbar - Laos Translation'}" do
      f.input "title_#{locale}", label: "Secret Navbar Title - #{locale}"
      f.input "description_#{locale}", as: :text, label: "Secret Navbar Description - #{locale}"
    end
  end
  f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  index do
    selectable_column
    column :title
    column :description
    column :created_at
    column "Number of attached categories" do |folder|
      folder.secret_categories.count
    end
    actions
  end

end
