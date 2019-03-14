class ChangeTypeToExerciseType < ActiveRecord::Migration[5.2]
  def change
    rename_column :snippets, :type, :exercise_type
  end
end
