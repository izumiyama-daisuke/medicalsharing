class CreateRelearns < ActiveRecord::Migration[6.0]
  def change
    create_table :relearns do |t|

      t.timestamps
    end
  end
end
