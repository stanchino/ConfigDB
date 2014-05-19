class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :organization

  validates_presence_of :organization, on: :update

  def full_name
    [first_name, last_name].reject(&:blank?).join(' ')
  end
end
