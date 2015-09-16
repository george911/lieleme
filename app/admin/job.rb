ActiveAdmin.register Job do
      permit_params :status,:avatar,:title, :interview,:employer,:addr, :city, :industry, :commission, :role, :requirement, :base_pay, :month, :bonus, :allowance, :stock, :stock_num, :concall_date, :user_id, :peer, :memo, :company_info, :work_year,
	bosses_attributes: [:title]
				 
 index do
    selectable_column
    id_column # 这样写才能变成link to job的链接
    column :title
    column :employer
    column :status
    column :city
    column :industry
    column :interview
    column :poster_id
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
