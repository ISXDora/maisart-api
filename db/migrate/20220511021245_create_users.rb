class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birth_date
      t.string :cpf
      t.string :email
      t.string :photo_url

      t.timestamps
    end
  end
end
