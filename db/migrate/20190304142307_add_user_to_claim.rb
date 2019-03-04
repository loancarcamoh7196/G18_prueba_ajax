class AddUserToClaim < ActiveRecord::Migration[5.2]
  def change
    add_reference :claims, :user, foreign_key: true
  end
end
