class UsersController < ApplicationController
  load_and_authorize_resource

  include Response

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    create_object(@user, @user, 'User was successfully created.')
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    update_object(@user, user_params, user_url(@user), 'User was successfully updated.')
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    destroy_object(@user, users_url, 'User was successfully destroyed.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name, :email, :password, organization_attributes: [:name])
    end
end
