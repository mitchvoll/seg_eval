class Dataset < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
end
