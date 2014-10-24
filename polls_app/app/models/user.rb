class User < ActiveRecord::Base
  validates :user_name, uniqueness: true, presence: true
  
  has_many(
  :authored_polls,
  class_name: 'Poll',
  foreign_key: :author_id,
  primary_key: :id
  )
  
  has_many(
  :responses,
  class_name: 'Response',
  foreign_key: :user_id,
  primary_key: :id
  )
  
  def completed_polls


    # SELECT
    #   polls.*
    # FROM
    #   polls
    # JOIN
    #   questions ON polls.id = questions.poll_id
    # LEFT OUTER JOIN
    #   answer_choices ON questions.id = answer_choices.question_id
    # JOIN
    #   responses ON responses.answer_choice_id = answer_choices.id
    # JOIN
    #
    #   (SELECT
    #     polls.id user_poll_id,
    #     COUNT(questions.id) AS user_poll_response_count
    #   FROM
    #     polls
    #   JOIN
    #     questions ON polls.id = questions.poll_id
    #   GROUP BY
    #     polls.id) AS questions_per_poll
    #
    # ON
    #   questions_per_poll.user_poll_id = polls.id
    # WHERE
    #   responses.user_id = 6
    # GROUP BY
    #   polls.id
    # HAVING
    #   COUNT(questions.id) = user_poll_response_count


  end
  
end


