class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :value

      t.timestamps
    end
  end
end
