class User < ApplicationRecord
  def self.search(search, word)
    case search
    when 'perfect'
      User.where('name LIKE?', User.sanitize_sql_like("#{word}"))
    when 'forward'
      User.where('name LIKE?', User.sanitize_sql_like("#{word}") + "%")
    when 'backward'
      User.where('name LIKE?', "%" + User.sanitize_sql_like("#{word}"))
    when 'partial'
      User.where('name LIKE?', "%" + User.sanitize_sql_like("#{word}") + "%")
    end
  end

  scope :name_search, -> (word) { where('name LIKE?', "%" + User.sanitize_sql_like("#{word}") + "%") }
end