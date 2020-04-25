ActiveAdmin.register Infographic do
  menu parent: "Upload Files"
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :sub_category_id, :category_id, :secret_category_id, :secret_sub_category_id, :english?, :pinned?
  permit_params  *Infographic.globalize_attribute_names, :sub_category_id, :category_id, :secret_category_id, :secret_sub_category_id, :english?, :lao?, :both_languages?, :pinned?, :photo
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
      f.input :sub_category, label: "Sub Category"
      f.input :secret_sub_category, label: "Secret Sub Category"
      f.input :category, label: "Category"
      f.input :secret_category, label: "Secret Category"
    end
     # shows errors on :base
    f.inputs "Language Preference" do
      f.input :english?, label: "Check this box if you want the Infographic to show to English Viewers only"
      f.input :lao?, label: "Check this box if you want the Infographic to show to Lao Viewers only"
      f.input :both_languages?, label: "Check this box if you want the Infographic to show to both Lao and English Viewers"
    end
    f.inputs "Would you like to pin Infographic or Poster as important in the attatched Category. This will make it appear near the top of the list. List sorted by date added otherwise." do
      f.input :pinned?, label: "Check this box if you want to pin this PDF"
    end
    f.actions
  end

  index do
    selectable_column
    column :title
    column "Image" do |folder|
      cl_image_tag(folder.photo.key, :width=>80, :crop=>"scale", quality: "5")
    end
    column "Image Size - MB" do |folder|
      (folder.photo.byte_size*0.000001).round(2)
    end
    column :english?
    column :lao?
    column :both_languages?
    column :pinned?
    column :created_at
    column :sub_category
    column :category
    column :secret_sub_category
    column :secret_category
    actions
  end

  show do
    attributes_table :title_en, :title_lo, :english?, :lao?, :both_languages?, :pinned?, :sub_category, :category, :secret_sub_category, :secret_category, :created_at, :updated_at
  end

end
