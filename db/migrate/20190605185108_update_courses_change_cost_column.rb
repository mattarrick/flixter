class UpdateCoursesChangeCostColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :courses, :cost, 'decimal USING CAST(cost AS decimal)'
  end
end
