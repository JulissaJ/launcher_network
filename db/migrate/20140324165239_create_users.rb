class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :fun_fact
      t.boolean :exp_engineer, null: false, default: false
      t.boolean :launcher, null: false, default: false

      t.timestamps
    end
  end
end
