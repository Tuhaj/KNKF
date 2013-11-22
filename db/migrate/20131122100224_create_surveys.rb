class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.text :description
      t.text :feedback
      t.references :user, index: true

      t.timestamps
    end
  end
end
