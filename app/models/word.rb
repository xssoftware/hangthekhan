class Word < ActiveRecord::Base
  belongs_to :category

  def title
    "#{word} [#{category.name}]"
  end
end
