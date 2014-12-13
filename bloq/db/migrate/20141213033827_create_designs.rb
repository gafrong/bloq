class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.text :info
      t.text :img_url
      t.text :link_url

      t.timestamps
    end
  end
end
