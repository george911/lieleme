ActiveAdmin.register LineItem do
 index do
    selectable_column
    column :mobile
    column :email
    column :name
    column :job_id
    column :sender_id
    column :recipient_id
    column :status
    column :interviewed
    end
 permit_params :mobile, :email, :name, :city,:user_id,:talent_id,:title,:status,:job_id 

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
