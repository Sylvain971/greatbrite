class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.string :place
      t.belongs_to :creator, index: true
      
      t.timestamps
    end
  end
end
