class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relations
  belongs_to :organization

  # Validations
  validates_presence_of :organization, on: :create
  validates_presence_of :first_name, :last_name

  # Hooks
  before_create :set_default_role, unless: :role_set?

  accepts_nested_attributes_for :organization

  def full_name
    [first_name, last_name].reject(&:blank?).join(' ')
  end

  private
  def set_default_role
    add_role(:user)
  end

  def role_set?
    roles.any?
  end
end
