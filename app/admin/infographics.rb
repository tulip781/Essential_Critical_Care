ActiveAdmin.register Infographic do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :sub_category_id, :category_id, :secret_category_id, :secret_sub_category_id, :english?, :pinned?
  permit_params  :sub_category_id, :category_id, :secret_category_id, :secret_sub_category_id, :english?, :pinned?, :photo
  form do |f|
    f.semantic_errors
    f.inputs "Upload the Infographic or Poster you want. It has to be PNG or JPEG" do
      f.input :photo, label: "Infographic upload", as: :file, input_html: { direct_upload: true }
    end
    I18n.available_locales.each do |locale|
      f.inputs " #{locale == :en ? 'English Translation ' : 'Laos Translation'}" do
        f.input "title_#{locale}", label: "#{locale == :en ? 'English Infographic Title ' : 'Laos Infographic Title'}"
      end
    end
    f.inputs "Select one Category to attach Infographic or Poster to" do
      f.input :category, label: "Category"
      f.input :sub_category, label: "Sub Category"
      f.input :secret_category, label: "Secret Category"
      f.input :secret_sub_category, label: "Secret Sub Category"
    end
     # shows errors on :base
    f.inputs "What language is your Infographic or Poster?" do
      f.input :english?, label: "Keep this box checked if your Infographic is English"
    end
    f.inputs "Would you like to pin Infographic or Poster as important in the attatched Category. This will make it appear near the top of the list. List sorted by date added otherwise." do
      f.input :pinned?, label: "Check this box if you want to pin this PDF"
    end
    f.actions
  end
  # or
  #
  # permit_params do
  #   permitted = [:title, :sub_category_id, :category_id, :secret_category_id, :secret_sub_category_id, :english?, :pinned?]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
