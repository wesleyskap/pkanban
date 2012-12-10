class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :Sprint
      t.string :name
      t.string :color
      t.decimal :priority
      t.decimal :column
      t.date :date_init
      t.date :date_end
      t.text :obs

      t.timestamps
    end
    add_index :tasks, :Sprint_id
  end
end
