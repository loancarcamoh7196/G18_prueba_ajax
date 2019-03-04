ActiveAdmin.register Company do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :name, :duns_number, :industry

index do
  column :id
  column :name
  column :rol_tributario do |company| 
    company.duns_number
  end 
  column :industry
  column :created_at
  actions
end

form do |f|
  inputs 'Company' do
    input :name
    input :duns_number
    input :industry
    actions
  end
end


end
