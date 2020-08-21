class AddDefaultValueToDueDateAttribute < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tasks, :due_date, nil
  end
end
