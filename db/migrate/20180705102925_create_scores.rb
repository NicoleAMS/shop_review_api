class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.string :name
      t.references :review

      t.timestamps
    end
  end
end
