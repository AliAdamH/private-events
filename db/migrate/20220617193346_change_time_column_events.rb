class ChangeTimeColumnEvents < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :time, :datetime
  end
end
