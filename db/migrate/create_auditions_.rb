class CreateAuditions < ActiveRecord::Migration[5.2]
  def change
    create_table :auditions do |t|
      t.string :actor
      t.string :location
      t.integer :pho:name
      t.boolean :hired
      t.integer :role_id
    end
    
  end
end
