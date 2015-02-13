class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :choice
      t.references :voter

      t.timestamps
    end
  end
end
