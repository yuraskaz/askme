class UsersController < ApplicationController

  before_action :load_user, except: [:index,:new,:create]
  before_action :authorize_user , except: [:index, :create, :new,:show]

  def index
    @users = User.all
  end

  def new
    redirect_to root_url,alert: 'Вы уже залогинены' if current_user.present?
    @user = User.new
  end

  def edit

  end

  def create
    redirect_to root_url,alert: 'Вы уже залогинены' if current_user.present?
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to root_url, notice: 'пользователь успешно зарегестрирован!'
    else
      render 'new'
    end

  end

  def update

    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Данные обновленны'
    else
      render 'edit'
    end

  end

  def show

    @questions = @user.questions.order(created_at: :desc)

    @new_question = @user.questions.build
    @questions_count = @questions.count
    @answers_count = @questions.where.not(answer: nil).count
    @unanswered_count = @questions_count - @answers_count

  end
  private
  #фильтр перед каждым action
  def load_user
    @user = User.find params[:id]
  end
  def authorize_user
    reject_user unless @user == current_user

  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_url)
  end
end
