ActiveAdmin.register Pdf do

  menu parent: "Upload Files"
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params *Pdf.globalize_attribute_names, :sub_category_id, :category_id, :secret_category_id, :secret_sub_category_id, :english?, :lao?, :both_languages?, :pinned?, :document
  form do |f|
    f.semantic_errors
    f.inputs "Upload the PDF you want" do
      f.input :document, label: "PDF upload", as: :file, input_html: { direct_upload: true }
    end
    I18n.available_locales.each do |locale|
      f.inputs " #{locale == :en ? 'English Translation ' : 'Laos Translation'}" do
        f.input "title_#{locale}", label: "#{locale == :en ? 'English PDF Title ' : 'Laos PDF Title'}"
      end
    end

    f.inputs "Select one Category to attach PDF to" do
      f.input :category, label: "Category"
      f.input :sub_category, label: "Sub Category"
      f.input :secret_category, label: "Secret Category"
      f.input :secret_sub_category, label: "Secret Sub Category"
    end

    f.inputs "Language Preference" do
      f.input :english?, label: "Check this box if you want the PDF to show to English Readers only"
      f.input :lao?, label: "Check this box if you want the PDF to show to Lao Readers only"
      f.input :both_languages?, label: "Check this box if you want the PDF to show to both Lao and English readers"
    end
    f.inputs "Would you like to pin PDF as important in the attatched Category. This will make it appear near the top of the list. List sorted by date added otherwise." do
      f.input :pinned?, label: "Check this box if you want to pin this PDF"
    end
    f.actions
  end

  index do
    selectable_column
    column :title
    column "PDF - Click to View" do |folder|
      link_to folder.document.service_url, target: :_blank do
        cl_image_tag(folder.document.key, :width=>50, :crop=>"scale", quality: "20", :format => :jpg)
      end
    end
    column "Image Size - MB" do |folder|
      (folder.document.byte_size*0.000001).round(2)
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
