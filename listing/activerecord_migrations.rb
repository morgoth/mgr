script/generate model exam student_id:integer started_at:datetime

class CreateExams < ActiveRecord::Migration
  def self.up
    create_table :exams do |t|
      t.integer :student_id
      t.datetime :started_at

      t.timestamps
    end
  end

  def self.down
    drop_table :exams
  end
end