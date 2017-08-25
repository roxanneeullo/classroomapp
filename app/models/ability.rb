class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
      cannot :manage, Grade
      cannot :manage, Activity
    elsif user.has_role? :teacher
      can :update, Course # author can update status
      can :manage, Grade
      can :manage, Activity
      can :update, User, :id => user.id
      can :manage, Teacher
      can :read, :all
    elsif user.has_role? :student
      can :update, User, :id => user.id
      can :manage, Student
      can :read, :all
    end
  end
end
