class AddColumnToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :description, :text
  end
end
