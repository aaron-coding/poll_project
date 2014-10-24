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
    # Poll.joins( :questions => { :answer_choices =>
    #                               { :responses => :respondent } } )
    #     .where()
    #     GROUP BY POLL
        # COUNT DISTINCT (responses.id) = COUNT DISTING (questions.id)
        # .where('responses.user_id =?', self.id)
                        
    

    # responses.joins(:answer_choice)
    # .joins(:question)
    # .joins('JOIN polls ON questions.poll_id = polls.id')
    # .joins('SELECT
    #     polls.id user_poll_id,
    #     COUNT(questions.id) AS user_poll_response_count
    #   FROM
    #     polls
    #   JOIN
    #     questions ON polls.id = questions.poll_id
    #   GROUP BY
    #     polls.id AS questions_per_poll
    #     ON questions_per_poll.user_poll_id = polls.id')
    #     .where('users.id = ?', self.id)
    #     .group('polls.id')
    #     .having('COUNT(responses.id) = user_poll_response_count')
    #
    # SELECT
    #   polls.*
    # FROM users
    # JOIN responses
    # ON users.id = responses.user_id
    # JOIN answer_choices
    # ON responses.answer_choice_id = answer_choices.id
    # JOIN questions
    # ON answer_choices.question_id = questions.id
    # JOIN polls
    # ON questions.poll_id = polls.id
    # JOIN
    #   (SELECT
    #     polls.id user_poll_id,
    #     COUNT(questions.id) AS user_poll_response_count
    #   FROM
    #     polls
    #   JOIN
    #     questions ON polls.id = questions.poll_id
    #   GROUP BY
    #     polls.id) AS questions_per_poll
    #     ON questions_per_poll.user_poll_id = polls.id
    # WHERE users.id = 6
    # GROUP BY polls.id
    # HAVING
    # COUNT(responses.id) = user_poll_response_count
    #

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
      # (SELECT
 #        polls.id user_poll_id,
 #        COUNT(questions.id) AS user_poll_response_count
 #      FROM
 #        polls
 #      JOIN
 #        questions ON polls.id = questions.poll_id
 #      GROUP BY
 #        polls.id) AS questions_per_poll
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


