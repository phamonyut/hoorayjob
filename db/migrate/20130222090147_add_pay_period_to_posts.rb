class AddPayPeriodToPosts < ActiveRecord::Migration
  def change
    add_column :employee_posts, :pay_period, :string
    add_column :employer_posts, :pay_period, :string
  end
end
