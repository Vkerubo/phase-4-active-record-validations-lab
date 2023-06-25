class Post < ApplicationRecord

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion:{in:["Fiction", "Non-Fiction"] }

  validate :not_allow_true_facts_title

  def not_allow_true_facts_title
    if title == "True Facts"
      errors.add(:title,"Title can't be True Facts")
    end
  end
end
