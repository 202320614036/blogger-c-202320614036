class Account < ApplicationRecord
    validates :email, uniqueness: true
     validates :account_name, uniqueness: { case_sensitive: true }

end
