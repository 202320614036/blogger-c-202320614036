class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ✅ Devise modülleri
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  # ✅ FriendlyId (slug için username kullanımı)
  extend FriendlyId
  friendly_id :username, use: :slugged

  # ✅ Gender enum
  enum :gender, {
    secret: 0,
    male: 1,
    female: 2
  }
  def admin?
  self.role == "admin" || self.admin == true
  end

  has_one :profile

  # ✅ Normalizasyonlar
  normalizes :firstname, with: ->(firstname) { firstname.squish.titlecase }
  normalizes :lastname,  with: ->(lastname)  { lastname.squish.titlecase }

  # ✅ Validasyonlar
  validates :firstname, presence: true, length: { maximum: 255 }
  validates :lastname,  presence: true, length: { maximum: 255 }
  validates :username,  presence: true, length: { maximum: 32 }, uniqueness: true
  validates :email,     presence: true, uniqueness: true
  validates :gender,    inclusion: { in: genders.keys }, allow_nil: true

  def fullname
    "#{firstname} #{lastname}"
  end

  class AddRoleToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role, :integer, default: 1
  end
 end
  has_many :posts, dependent: :destroy


  belongs_to :profile, optional: true
end
