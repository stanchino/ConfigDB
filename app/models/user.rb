class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relations
  belongs_to :account
  has_many :organizations, through: :account

  # Validations
  #validates_presence_of :organization, on: :create
  validates_presence_of :full_name

  # Hooks
  before_create :set_default_role, unless: :role_set?

  accepts_nested_attributes_for :account

  def first_name
    full_name.present? ? extract_names[0] : ''
  end

  def last_name
    full_name.present? && extract_names.size > 1 ? extract_names[-1] : ''
  end

  private
  def set_default_role
    add_role(:user)
  end

  def role_set?
    roles.any?
  end

  def extract_names
    @extracted_names ||= full_name.split(' ')
  end
end
