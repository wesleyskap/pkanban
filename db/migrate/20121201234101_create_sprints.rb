class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.references :User
      t.string :name
      t.date :date_init
      t.date :date_end

      t.timestamps
    end
    add_index :sprints, :User_id
  end
end
