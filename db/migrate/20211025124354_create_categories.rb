class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories, id: false do |t|
      t.bigint :id
      t.string :name, null: false

      t.timestamps
    end
  end
end
