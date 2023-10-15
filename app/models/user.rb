class User < ApplicationRecord
  def self.search(search, word)
    case search
    when 'perfect'
      User.where('name LIKE?', "#{word}")
    when 'forward'
      User.where('name LIKE?', "#{word}%")
    when 'backward'
      User.where('name LIKE?', "%#{word}")
    when 'partial'
      User.where('name LIKE?', "%#{word}%")
    end
  end
end