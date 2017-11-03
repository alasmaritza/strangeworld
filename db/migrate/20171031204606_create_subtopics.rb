class CreateSubtopics < ActiveRecord::Migration[5.0]
  def change
    create_table :subtopics do |t|
      t.string :title
     # t.string :subtitle
      t.integer :section_id
      t.timestamps
    end
    
    add_index :subtopics, :section_id
  end
end
