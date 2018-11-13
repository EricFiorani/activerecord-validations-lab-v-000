class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.title
      unless record.title.match /Secret|Top|Guess|Won't Believe/
        record.errors[:title] << 'Not sufficiently click-bait-y'
      end
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
end
