class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.date :date
      t.text :title

      t.timestamps
    end
  end
end
