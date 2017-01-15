class AddHeadingColumnToStation < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :heading, :integer
  end
end
