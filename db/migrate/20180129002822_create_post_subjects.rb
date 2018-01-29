class CreatePostSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :post_subjects do |t|
      t.integer :post_id
      t.integer :subject_id
    end
  end
end
