class Author < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :phone_number, length: { is: 10 }
  end
class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
    validate :click?
  
    STRINGS = [/Secret/i, /Won't Believe/i, /Guess/i, /Top \d/i]
    def click?
      if STRINGS.none? { |t| t.match title }
        errors.add(:title, "must be clickbait")
      end
    end
  end