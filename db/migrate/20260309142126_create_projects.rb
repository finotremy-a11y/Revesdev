class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.json :tech_stack
      t.string :repo_url
      t.string :live_url
      t.integer :position
      t.boolean :featured

      t.timestamps
    end
  end
end
