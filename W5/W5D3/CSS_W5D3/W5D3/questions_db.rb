require 'sqlite3'
require 'singleton'
require 'byebug'
class QuestionDBConnection < SQLite3::Database
    include Singleton
    
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end


class User
    attr_accessor :id, :fname, :lname 

    def self.find_by_id(id)
        user_hash = QuestionDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
            SQL
            #debugger
        User.new(user_hash[0])
    end

    def self.find_by_name(fname, lname)
        user_hash = QuestionDBConnection.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?
            SQL
        User.new(user_hash[0])
    end

    def initialize(options)
        @id = options["id"]
        @fname = options["fname"]
        @lname = options["lname"]
    end

    def authored_questions
        Question.find_by_author_id(self.id)
    end

    def authored_replies
        Reply.find_by_user_id(self.id)
    end
end

class Question

    attr_accessor :id, :title, :body, :users_id

    def self.find_by_id(id)
        question_hash = QuestionDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
            SQL
        Question.new(question_hash[0])
    end

    def self.find_by_author_id(author_id)
        question_hash = QuestionDBConnection.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                users_id = ?
            SQL
        Question.new(question_hash[0])
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @users_id = options['users_id']
    end

    def author
        User.find_by_id(self.users_id)
    end

    def replies
        Reply.find_by_question_id(self.id)
    end
end

class QuestionFollow

    attr_accessor :questions_id, :users_id

    
    def self.followers_for_question_id(question_id)
        hash_array = QuestionDBConnection.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM
            users
        INNER JOIN
            question_follows ON question_follows.users_id = users.id
        INNER JOIN
            questions ON question_follows.questions_id = questions.id
        WHERE
            questions.id = ?
        SQL
        hash_array.map { |post| User.new(post)}
    end

    def self.followed_questions_for_user_id(user_id)
        hash_array = QuestionDBConnection.instance.execute(<<-SQL, user_id)
        SELECT
            *
        FROM
            questions
        INNER JOIN
            question_follows ON question_follows.users_id = questions.id
        INNER JOIN
            users ON question_follows.questions_id = users.id
        WHERE
            users.id = ?
        SQL
        hash_array.map { |post| Question.new(post)}
    end

    def initialize(options)
        @questions_id = options['questions_id']
        @users_id = options['users_id']
    end
end


class Reply
    attr_accessor :id, :subject_question_id, :parent_reply_id, :users_id, :body

    def self.find_by_id(id)
            reply_hash = QuestionDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
            SQL
        Reply.new(reply_hash[0])
    end

    def self.find_by_user_id(users_id)
        reply_hash = QuestionDBConnection.instance.execute(<<-SQL, users_id)
            SELECT
                *
            FROM
                replies
            WHERE
                users_id = ?
        SQL
        
        reply_hash.map {|post| Reply.new(post)}
    end

    def self.find_by_question_id(question_id)
        reply_hash = QuestionDBConnection.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL

        reply_hash.map {|post| Reply.new(post)}
    end

    def initialize(options)
        @id = options['id']
        @subject_question_id = options['subject_question_id']
        @parent_reply_id = options['parent_reply_id']
        @users_id = options['users_id']
        @body = options['body']
    end

    def author
        User.find_by_id(self.users_id)
    end

    def question
        Question.find_by_id(self.subject_question_id)
    end

    def parent_reply
        Reply.find_by_id(self.parent_reply_id)
    end

    def child_replies #[{}]
        hash = QuestionDBConnection.instance.execute(<<-SQL, self.id) 
        SELECT
        *
        FROM 
            replies
        WHERE
        parent_reply_id = ?
    SQL
        hash.map {|post| Reply.new(post)}
    end
end

#question
    #-reply1
        #-reply 2
        #-reply 3
    # -reply4

class QuestionLike

    def self.find_like(questions_id, users_id)
        like_hash = QuestionDBConnection.instance.execute(<<-SQL, questions_id, users_id)
        SELECT
            *
        FROM
            question_likes
        WHERE
            questions_id = ? AND users_id = ?
        SQL
        QuestionLike.new(like_hash[0])
    end
    
    def initialize(options)
        @questions_id = options['questions_id']
        @users_id = options['users_id']
    end

    
end










