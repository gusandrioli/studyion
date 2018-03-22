class AddIsteacherToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :isteacher, :boolean, default: false
  end
end
