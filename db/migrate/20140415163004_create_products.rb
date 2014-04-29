class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

        t.string :name
        t.text :description
        t.string :category
        t.text :image_url
    
      t.timestamps
    end
  end
end
