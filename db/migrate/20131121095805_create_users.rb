class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.boolean :knkf_member
      t.references :meeting, index: true

      t.timestamps
    end
  end
end