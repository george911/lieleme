class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       can :manage,Inquiry
       can :read, [Job,Comment]
       if user.user_type == "人事" and user.verify == "hr"
	 can :read,@search
	 can :manage, LineItem
	 can [:read], [User,Review,Comment]
	 can :manage,Job
       elsif user.user_type == "猎头"
         can :read,@search
	 can :read,User
	 can [:read],Job
	 can [:create],LineItem
       elsif user.user_type == "求职者"
	 can :read, Job
	 can :update,LineItem
	 can :manage,Comment
	 can :update,User
	 can :read,User,user_type:"猎头"
       else
       end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
