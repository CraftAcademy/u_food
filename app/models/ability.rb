class Ability
  include CanCan::Ability

  def initialize(admin)
    admin ||= AdminUser.new
      if admin.admin?
        can :manage, :all
      else
        can :read, :all
      end
  end
end