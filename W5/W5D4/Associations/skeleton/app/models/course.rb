# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

    has_many :enrollments, 
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :enrolled_students,
        through: :enrollments,
        source: :user
    
    belongs_to :prerequisite, #using has_one, there is only one on both ends. Prereq only has one following class, and a class only has one prerequisite.
        primary_key: :prereq_id,
        foreign_key: :id,
        class_name: :Course

    belongs_to :instructor, #instructors can teach many courses, but a course can only have one instructor.
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :User

        #one to many relationships such as dogs that own multiple toys we use "has_many" and "belongs_to". 
        # one to one relationships like a person and a twitter account. We use has_one. 
end
