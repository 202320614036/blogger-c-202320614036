class Profile < ApplicationRecord
    has_one :user, dependent: :destroy
    has_rich_text :bio # Eğer ActionText kullanıyorsan, bu satır kalmalı
    validates :bio, presence: true
end
