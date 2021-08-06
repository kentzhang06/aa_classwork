require_relative 'users.rb'
require_relative 'questionlikes.rb'
require_relative 'questions.rb'
require_relative 'questionfollows.rb'

class Replies
  attr_accessor :id, :question_id, :parent_id, :user_id, :body
  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil if reply.length < 1
    Replies.new(reply[0])
  end

  def self.find_by_user_id(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL,user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil if reply.length < 1
    reply.map{|ele| Replies.new(ele)}
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL,question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil if reply.length < 1
    reply.map{|ele| Replies.new(ele)}
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def author
    Users.find_by_id(self.user_id)
  end

  def question
    Questions.find_by_id(self.question_id)
  end

  def parent_reply
    return nil if self.parent_id == nil
    Replies.find_by_id(self.parent_id)
  end

  def child_replies
    reply = QuestionsDatabase.instance.execute(<<-SQL, self.id)
    SELECT
    *
    FROM
    replies
    WHERE
      parent_id = ?
    SQL

    return nil if reply.length < 1
    reply.map{|ele| Replies.new(ele)}
  end
end