class Question < ActiveRecord::Base

  belongs_to :user

  validates :text, :user, presence: true
  #проверка максимальной длины создаваемого вопроса-не более 255
  #если более 255 символов то вопрос не будет создан
  validates :text, length: {maximum: 256}
end
