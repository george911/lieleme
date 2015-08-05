class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       if user.user_type == "人事" and user.verify == "hr"
	 can [:update,:read], [LineItem]
	 can [:read], [User,Job,Review,Comment]
       elsif user.user_type == "猎头"
         can [:read,:create,:update,:destroy], :all
       elsif user.user_type == "求职者"
	 can :read, [Job,Review,Comment,User]
       else
	 can :read, [Job,Comment]
	 can [:read,:create,:update,:destroy], [Inquiry] 
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
