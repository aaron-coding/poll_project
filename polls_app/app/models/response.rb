class Response < ActiveRecord::Base
  validates :answer_choice_id, :user_id, presence: true
  validate :respondent_has_not_already_answered_question
  validate :author_cannot_respond_to_own_poll
  
  belongs_to(
  :respondent,
  class_name: 'User',
  foreign_key: :user_id,
  primary_key: :id
  )
  
  belongs_to(
  :answer_choice,
  class_name: 'AnswerChoice',
  foreign_key: :answer_choice_id,
  primary_key: :id
  )
  
  has_one(
  :question,
  through: :answer_choice,
  source: :question
  )
  
  def sibling_responses
   if self.new_record? #not in DB
     question.responses
   else #I'm in DB
     question.responses.where('responses.id != ?', self.id)
   end
  end
  
  private
  
  def respondent_has_not_already_answered_question
    unless sibling_responses.where('responses.user_id = ?', self.user_id).empty?
      errors[:base] << "Respondent has already answered question"
    end
  end
  
  
  def author_cannot_respond_to_own_poll
    if question.poll.author_id == user_id
      errors[:base] << "Author can't respond to own poll"
    end
  end
end