class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.references :answer
      t.references :user
    end
  end
end
