ActiveAdmin.register Job do
  index do
    selectable_column
    column :title
    column :employer
    column :status
    column :city
    column :industry
    column :interview
  end

  filter :title_or_employer_or_status_or_city_or_industry, as: :string
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
