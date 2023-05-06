class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.references :questionnaire, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
