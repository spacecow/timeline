class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :article_id
      t.integer :event_id
    end
  end
end
