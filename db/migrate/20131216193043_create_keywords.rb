class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :word
      t.boolean :enabled, default: true
      t.float :clickrate, default: 0.0
      t.timestamps
    end
  end
end
