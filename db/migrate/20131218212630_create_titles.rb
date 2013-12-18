class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :value

      t.timestamps
    end
  end
end
