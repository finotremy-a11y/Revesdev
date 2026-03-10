class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message
      t.boolean :read_status

      t.timestamps
    end
  end
end
