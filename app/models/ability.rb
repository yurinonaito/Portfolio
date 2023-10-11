# frozen_string_literal: true

class Ability
  include CanCan::Ability
  # ログインしている＆admin?メソッドを持つユーザーは、rails_adminへのアクセス権限があり、全てのモデルのCRUDが行える状態
  def initialize(user)
    if user.try(:admin?)
      can :access, :rails_admin
      can :manage, :all
    end
  end
end
