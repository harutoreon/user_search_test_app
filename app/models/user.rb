class User < ApplicationRecord
  scope :search, -> (search, word) do
    scope :perfect_search,  -> { where('name LIKE?', "#{word}") if word.present? }
    scope :forward_search,  -> { where('name LIKE?', "#{word}%") if word.present? }
    scope :backward_search, -> { where('name LIKE?', "%#{word}") if word.present? }
    scope :partial_search,  -> { where('name LIKE?', "%#{word}%") if word.present? }

    send("#{search}_search")
  end
end