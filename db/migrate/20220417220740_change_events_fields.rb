class ChangeEventsFields < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :date, :date
    add_column :events, :time, :time
  end
end
