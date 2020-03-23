class AddDefaultValueToCompletedAttribute < ActiveRecord::Migration[6.0]
  def up
    change_column_default :tasks, :completed, false
end

def down
    change_column_default :tasks, :completed, nil
end
end
