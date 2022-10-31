class Ability
  include CanCan::Ability

  def initialize(user)
    if user.super_admin?
    can :manage, :all
    elsif user.admin?
      can [:read, :update], Company, user: user
    end
  end
end