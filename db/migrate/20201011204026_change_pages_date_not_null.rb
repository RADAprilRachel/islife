class ChangePagesDateNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :pages, :date, false
  end
end
