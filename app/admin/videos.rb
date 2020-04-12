ActiveAdmin.register Video do

  menu parent: "Upload Files"
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params *Video.globalize_attribute_names, :url, :sub_category_id, :category_id, :secret_category_id, :secret_sub_category_id, :english?, :lao?, :both_languages?, :pinned?
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Upload the Url Vimeo you want" do
      f.input :url, label: "Paste The Vimeo Link Here. It has to be in the format 'https://vimeo.com/395780253' "
    end
    I18n.available_locales.each do |locale|
      f.inputs " #{locale == :en ? 'Video - English Translation ' : 'Video - Laos Translation'}" do
        f.input "title_#{locale}", label: "#{locale == :en ? 'Video Title - English Translation ' : 'Video Title - Laos Translation'}"
      end
    end
    f.inputs "Select one category of these to attach Video to. You must only choose one of these four." do
      f.input :category
      f.input :sub_category, label: "Sub Categories"
      f.input :secret_category, label: "Secret Category"
      f.input :secret_sub_category, label: "Secret Sub Category"
    end
    f.inputs "Language Preference" do
      f.input :english?, label: "Check this box if you want the Video to show to English Viewers only"
      f.input :lao?, label: "Check this box if you want the Video to show to Lao Viewers only"
      f.input :both_languages?, label: "Check this box if you want the Video to show to both Lao and English Viewers"
    end
    f.inputs "Would you like to pin Video as important in the attatched Category. This will make it appear near the top of the list. List sorted by date added otherwise." do
      f.input :pinned?, label: "Check this box if you want to pin this Video"
    end
    f.actions
  end
  index do
    selectable_column
    column :title
    column "Url - Click to View" do |folder|
      link_to folder.url, target: :_blank do
        folder.url
      end
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
end
