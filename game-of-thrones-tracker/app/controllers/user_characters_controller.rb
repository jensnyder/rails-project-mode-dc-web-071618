class UserCharactersController < ApplicationController

  def index
    @user_characters = UserCharacter.all
  end

  def show
    @user_character = UserCharacter.find(params[:id])
  end

  def new
    @user_character = UserCharacter.new(character_id: params[:id])
  end

  def create
    @user_character = UserCharacter.new(user_character_params)
    if @user_character.save
      if !params["user_character"]["location"]["name"].empty?
        new_location = Location.create(
          name: params["user_character"]["location"]["name"],
          description: params["user_character"]["location"]["description"],
          region: Region.find(params["user_character"]["location"]["region_id"])
        )
        @user_character.location = new_location
        @user_character.save
      end
      redirect_to user_character_path(@user_character)
    else
      render :new
    end
  end

  def edit
    @user_character = UserCharacter.find(params[:id])
  end

  def update
    @user_character = UserCharacter.find(params[:id])
    if @user_character.update(user_character_params)
      if !params["user_character"]["location"]["name"].empty?
        new_location = Location.create(
          name: params["user_character"]["location"]["name"],
          description: params["user_character"]["location"]["description"],
          region: Region.find(params["user_character"]["location"]["region_id"])
        )
        @user_character.location = new_location
        @user_character.save
      end
      redirect_to user_character_path(@user_character)
    else
      render :edit
    end
  end

  def destroy
    @user_character = UserCharacter.find(params[:id])
    @user_character.destroy
    redirect_to user_characters_path
  end

  private
  def user_character_params
    params.require(:user_character).permit(:character_id, :user_id, :status, :note, :location_id, location_attributes: [:name, :description, :region_id])
  end

end
