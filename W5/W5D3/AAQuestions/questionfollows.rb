require_relative 'users.rb'
require_relative 'replies.rb'
require_relative 'questions.rb'
require_relative 'questionlikes.rb'

class QuestionFollows
  attr_accessor :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    return nil if question_follows.length < 1
    QuestionFollows.new(question_follows[0])
  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        fname, lname
      FROM
        question_follows
      JOIN
        users
      ON
        users.id = question_follows.user_id
      WHERE
        question_id = ?
    SQL
    return nil if followers.length < 1
    followers.map { |ele| Users.find_by_name(ele[0], ele[1])}
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      questions.id
    FROM
      question_follows
    JOIN
      questions
    ON
      questions.id = question_follows.question_id
    WHERE
      question_follows.user_id = ?
    SQL

    return nil if questions.length < 1
    questions.map { |ele| Questions.find_by_id(ele['id']) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      question_id, COUNT(user_id) AS tot_followers
    FROM
      question_follows
    GROUP BY
      question_id
    ORDER BY
      tot_followers DESC
    LIMIT
      ?

    SQL
    questions.map { |ele| Questions.find_by_id(ele['question_id']) }
  end
end