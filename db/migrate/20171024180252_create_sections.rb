class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :compilation_id

      t.timestamps
    end
    
    add_index :sections, :compilation_id
  end
end
