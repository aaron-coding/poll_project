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
    output = Hash.new(0)
    choices = answer_choices.includes(:responses)
    choices.each do |choice|
      output[choice.text] = choice.responses.length
    end
    output
  end
end

# SELECT
#   answer_choices.*, COUNT(responses.id)
# FROM
#   answer_choices
# LEFT OUTER JOIN
#   responses
# ON
#   responses.answer_choice_id = answer_choices.id
# WHERE
#   answer_choices.question_id = self.id
# GROUP BY
#   answer_choices.id