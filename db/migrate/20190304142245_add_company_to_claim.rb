class AddCompanyToClaim < ActiveRecord::Migration[5.2]
  def change
    add_reference :claims, :company, foreign_key: true
  end
end
