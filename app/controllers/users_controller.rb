class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
                    name:'Yura',username:'yuraskaz',avatar_url:'https://secure.gravatar.com/avatar/71269686e0f757ddb4f73614f43ae445?s=100'
    )
    @new_question= Question.new
  end
end
