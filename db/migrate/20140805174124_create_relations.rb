class CreateRelations < ActiveRecord::Migration
  def up
    create_table :relations do |t|
      t.integer :from_article_id, null:false
      t.integer :to_article_id, null:false
    end
    #add_foreign_key(:relations, :articles, column:'from_article_id')
    execute "alter table relations add foreign key (from_article_id) references articles (id)"
    execute "alter table relations add foreign key (to_article_id) references articles (id)"
  end

  def down
    drop_table :relations
  end
end
