class AddImageToCompilations < ActiveRecord::Migration[5.0]
  def change
    add_column :compilations, :image, :string
  end
end
