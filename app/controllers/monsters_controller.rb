class MonstersController < ApplicationController

    def index
        monsters = Monster.all 
        render json: monsters
    end

    def create
        monster = Monster.create(monster_params)
        render json: monster
    end

    def update
        monster = Monster.find(params[:id])
        monster.update(monster_params)
        render json: monster
    end

    def destroy
        monster = Monster.find(params[:id])
        monster.destroy
        render json: monster
    end
    private
    def monster_params
        params.require(:monster).permit(:name, :age, :specialty, :quote, :image)
    end

end
