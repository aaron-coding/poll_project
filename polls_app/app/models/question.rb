class Question < ActiveRecord::Base
  validates :text, presence: true
  validates :poll_id, presence: true
  
  belongs_to(
    :poll,
    class_name: 'Poll',
    foreign_key: :poll_id,
    primary_key: :id
  )
  
  has_many(
    :answer_choices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id,
    primary_key: :id
  )
  
  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )
  
  def results
    answer_choices.select('answer_choices.*')
    .joins('LEFT OUTER JOIN responses ON responses.answer_choice_id = answer_choices.id')
    .group('answer_choices.text').count('responses.id')
  end
end

