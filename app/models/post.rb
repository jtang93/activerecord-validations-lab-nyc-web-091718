require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-fiction"]}
  validate :clickbait

  def clickbait
    array = ["Won't Believe", "Secret", "Top", "Guess"]
    # binding.pry
    if title != nil
      if array.any? {|bait| title.include? bait} == false
        errors.add :title, "clickbait"
      # unless record.name & array.present?
      #   post.errors[:name] << "Need a name containing #{array}."
      end
    end
  end

end
