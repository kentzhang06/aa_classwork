require_relative 'users.rb'
require_relative 'replies.rb'
require_relative 'questions.rb'
require_relative 'questionfollows.rb'

class QuestionLikes
  attr_accessor :id, :user_id, :question_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    return nil if question_like.length < 1
    QuestionLikes.new(question_like[0])
  end

  def self.likers_for_question_id(question_id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      *
    FROM
      question_likes
    WHERE
      question_id = ?
    SQL
    return nil if question_like.length < 1
    question_like.map { |ele| Users.find_by_id(ele['user_id']) }
  end

  def self.num_likes_for_question_id(question_id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      COUNT(question_id) AS like_count
    FROM
      question_likes
    WHERE
      question_id = ?
    SQL
    question_like[0]['like_count']
  end

  def self.liked_questions_for_user_id(user_id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      question_id
    FROM
      question_likes
    WHERE
      user_id = ?
    SQL
    question_like.map { |ele| Questions.find_by_id(ele['question_id'])}
  end

  def self.most_liked_questions(n)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      question_id, COUNT(user_id) AS tot_followers
    FROM
      question_likes
    GROUP BY
      question_id
    ORDER BY
      tot_followers DESC
    LIMIT
      ?

    SQL
    question_like.map { |ele| Questions.find_by_id(ele['question_id']) }
  end
end