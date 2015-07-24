class UsersController < ApplicationController
  before_action :check_auth, except: [:index, :attempt_login, :logout, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @user = User.new
  end

  # GET /users/1
  # GET /users/1.json
  # def show
    
  # end

  # GET /users/1/edit
  def edit
    if params[:id].to_i != session[:user_id]
      redirect_to(:controller => 'sweets', :action => 'index')
      return
    end
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.followers = 0
    @user.following = 0
    @user.sweets = 0

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        session[:username] = @user.username
        #redirect_to(:controller => 'sweets', :action => 'index')
        format.html { redirect_to :controller => 'sweets', :action => 'index', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        #redirect_to(:action => 'index')
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def list
    @users = User.all
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
   respond_to do |format|
     if @user.update(user_params)
       format.html { redirect_to :controller => 'sweets', :action => 'index', notice: 'User was successfully updated.' }
       format.json { render :show, status: :ok, location: @user }
     else
       format.html { render :edit }
       format.json { render json: @user.errors, status: :unprocessable_entity }
     end
   end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  #def destroy
  #  @user.destroy
  #  respond_to do |format|
  #    format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  def attempt_login
    if params[:username].present? && params[:password].present?
      user = User.where(:username => params[:username]).first
      if user
        status = user.authenticate(params[:password])
      end
    end
    if status
      session[:user_id] = user.id
      session[:username] = user.username
      flash[:notice] = "Log in successful"
      redirect_to(:controller => 'sweets', :action => 'index')
    else
      reset_session
      flash[:notice] = "Log in failed"
      redirect_to(:action => 'index')
    end
  end

  def logout
    reset_session
    flash[:notice] = "Logged out"
    redirect_to(:action => 'index')
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
