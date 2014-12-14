class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.text :title
      t.text :img_url
      t.text :link_url

      t.timestamps
    end
  end
end
