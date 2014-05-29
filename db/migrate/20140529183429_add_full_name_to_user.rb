class AddFullNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    User.reset_column_information
    User.all.each do |user|
      attributes = user.attributes
      full_name = [attributes[:first_name], attributes[:last_name]].reject(&:blank?).join(' ')
      user.update_attribute(:full_name, full_name)
    end
  end
end
