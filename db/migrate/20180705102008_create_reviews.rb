class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.references :shop

      t.timestamps
    end
  end
end
