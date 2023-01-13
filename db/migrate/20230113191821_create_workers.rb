class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.integer :mobileno
      t.integer :age
      t.string :email
      t.text :address
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
