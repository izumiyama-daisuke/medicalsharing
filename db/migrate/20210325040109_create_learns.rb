class CreateLearns < ActiveRecord::Migration[6.0]
  def change
    create_table :learns do |t|
      t.integer :job_id,           null: false
      t.integer :gender_id,        null: false
      t.text :study,               null: false
      t.integer :prefecture_id,    null: false
      t.integer :area_id,          null: false
      t.text :area_provided
      t.integer :thankyou_money
      t.integer :learn_num_id,     null: false
      t.text :condition
      t.references :user,          null: false, foreign_key: true 

      t.timestamps
    end
  end
end
