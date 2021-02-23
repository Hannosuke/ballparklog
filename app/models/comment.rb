class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :ballpark_log
end
