class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :from_article_id
    end
  end
end
