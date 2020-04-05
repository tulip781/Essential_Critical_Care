ActiveAdmin.register SecretCategory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :secret_navbar_base_folder_id, :has_secret_subcategory, :title, :description
  permit_params *SecretCategory.globalize_attribute_names

  form do |f|
  f.semantic_errors # shows errors on :base
  f.inputs          # builds an input field for every attribute
  I18n.available_locales.each do |locale|
    f.inputs " #{locale == :en ? 'Secret Category - English Translation ' : 'Secret Category - Laos Translation'}" do
      f.input "title_#{locale}", label: "Secret Category Title - #{locale}"
      f.input "description_#{locale}", as: :text, label: "Secret Category Description - #{locale}"
    end
  end
  f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
  #
  # permit_params do
  #   permitted = [:secret_navbar_base_folder_id, :has_secret_subcategory, :title, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
