class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validate :clickbait_title

  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  

  def clickbait_title
    
        if title.blank? || !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top") && !title.include?("Guess")
          errors.add(:title, "must be clickbait-y!")
        end
      end
end
