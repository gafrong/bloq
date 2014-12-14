class CreateTeches < ActiveRecord::Migration
  def change
    create_table :teches do |t|
      t.text :title
      t.text :img_url
      t.text :link_url

      t.timestamps
    end
  end
end
