class Ability
  include CanCan::Ability

  def initialize(user)
 	can :read, :all
 	can :destroy, Reading, user_id: user.id
  end
end