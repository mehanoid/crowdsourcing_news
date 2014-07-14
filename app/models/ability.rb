class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)

    can :read, NewsItem, confirmed: true
    can :read, NewsCategory

    if user
      can :create, NewsItem
      can %i[read update destroy], NewsItem, user: user

      if user.admin?
        can :read, ActiveAdmin::Page, name: 'Dashboard'
        can %i[confirm destroy], NewsItem
        can :manage, NewsCategory
        can :manage, User
      end
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply t 5o every action. Other common actions
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
