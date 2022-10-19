class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait?

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    #Custom Validations
    def clickbait?
        if CLICKBAIT_PATTERNS.none? {|pat| pat.match title}
            errors.add(:title, "Not clickbait-y enough")
        end
    end

end
