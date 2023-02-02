# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can [:update, :destroy], [Post, Comment], :author_id => user.id
    end
  end
end
