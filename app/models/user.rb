class User < ApplicationRecord
  scope :search, -> (search, word) do
    scope :perfect_search,  -> { where('name LIKE ?', "#{word}") }
    scope :forward_search,  -> { where('name LIKE ?', "#{word}%") }
    scope :backward_search, -> { where('name LIKE ?', "%#{word}") }
    scope :partial_search,  -> { where('name LIKE ?', "%#{word}%") }

    send("#{search}_search")
  end
end