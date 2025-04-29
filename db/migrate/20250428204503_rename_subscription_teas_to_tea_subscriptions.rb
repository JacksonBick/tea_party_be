class RenameSubscriptionTeasToTeaSubscriptions < ActiveRecord::Migration[7.1]
  def change
    rename_table :subscription_teas, :tea_subscriptions
  end
end
