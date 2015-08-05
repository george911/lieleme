ActiveAdmin.register User do
      permit_params :verify,:tag_list,:avatar,:mobile, :user_name, :true_name, :user_type, :email, :birthday,:city,:title,:base_salary, :month_num, :bonus, :housing, :transport, :stock,:stock_num, :retention_bonus, :expect_package, :expect_month_salary,summaries_attributes: [:user_id, :content, :_destroy],educations_attributes: [:user_id, :school, :enter_school, :leave_school,:major, :degree, :_destroy]


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
