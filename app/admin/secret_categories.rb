ActiveAdmin.register SecretCategory, as: "Hidden Category" do

  menu parent: "Hidden Resources"
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :secret_navbar_base_folder_id, :has_secret_subcategory, :title, :description
  permit_params *SecretCategory.globalize_attribute_names, :secret_navbar_base_folder_id, :has_secret_subcategory

  form do |f|
  f.semantic_errors # shows errors on :base
  f.inputs          # builds an input field for every attribute
  I18n.available_locales.each do |locale|
    f.inputs " #{locale == :en ? 'Hidden Category - English Translation ' : 'Hidden Category - Laos Translation'}" do
      f.input "title_#{locale}", label: "Hidden Category Title - #{locale}"
      f.input "description_#{locale}", as: :text, label: "Hidden Category Description - #{locale}"
    end
  end
  f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  index do
    selectable_column
    column "Hidden Category Title" do |folder|
      folder.title
    end
    column "Hidden Category Description" do |folder|
      folder.description
    end
    column "Parent Topic" do |folder|
      folder.secret_navbar_base_folder.title
    end
    column "Number of Sub Categories attatched" do |folder|
      folder.secret_sub_categories.count
    end
    column "Sub Categories Visible" do |folder|
      folder.has_secret_subcategory
    end
    column "Uploads Attached if No Subcategory " do |folder|
      folder.pdfs.count + folder.videos.count + folder.infographics.count
    end
    column "PDFS Attached if No Subcategory" do |folder|
      folder.pdfs.count
    end
    column "Videos Attached if No Subcategory" do |folder|
      folder.videos.count
    end
    column "Infographics Attached if No Subcategory" do |folder|
      folder.infographics.count
    end
    column :created_at
    actions
  end
  #
  # permit_params do
  #   permitted = [:secret_navbar_base_folder_id, :has_secret_subcategory, :title, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
