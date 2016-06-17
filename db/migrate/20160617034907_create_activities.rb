class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user
      t.integer :group
      t.string :name
      t.text :content
      t.integer :status

      t.timestamps null: false
    end
  end
end
