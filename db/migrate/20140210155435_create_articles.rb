class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.integer :universe_id
      t.string :image
      t.string :type
    end
  end
end
