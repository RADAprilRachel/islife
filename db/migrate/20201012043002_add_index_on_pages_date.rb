class AddIndexOnPagesDate < ActiveRecord::Migration[6.0]
  def change
    add_index :pages, :date
  end
end
