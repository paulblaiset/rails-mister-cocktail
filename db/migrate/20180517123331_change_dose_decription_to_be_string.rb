class ChangeDoseDecriptionToBeString < ActiveRecord::Migration[5.2]
  def change
    change_column :doses, :description, :string
  end
end
