class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.integer :title_id
      t.integer :sentence1_id
      t.integer :sentence2_id
      t.string :url
      t.float :clickrate, default: 0.0
      t.float :expenses, default: 0.0
      t.float :conversion, default: 0.0
      t.timestamps
    end
  end
end
