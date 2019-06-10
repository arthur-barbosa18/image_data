class CreateImageData < ActiveRecord::Migration[5.2]
  def change
    create_table :image_data do |t|
      t.decimal :height
      t.decimal :width
      t.datetime :deleted_at, index: true
      t.timestamps
      end
  end
end
