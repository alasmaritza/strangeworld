class CreateCompilations < ActiveRecord::Migration[5.0]
  def change
    create_table :compilations do |t|
      
      t.string :title
      t.text :description
      t.decimal :donation
      t.integer :user_id

      t.timestamps
    end
    add_index :compilations, :user_id
  end
end
