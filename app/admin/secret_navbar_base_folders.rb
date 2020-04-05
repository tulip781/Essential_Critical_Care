ActiveAdmin.register SecretNavbarBaseFolder do

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
  #
  # permit_params do
  #   permitted = [:title, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
