module Api
    module V1
        class FavoritesController < ApplicationController
			before_action :set_member, only: [:create, :destroy]
            def create
                favorite = @member.favorites.build(item_id: params[:item_id])
				if favorite.save
					render json: {
                        status: 'SUCCESS',
                        data: favorite
					}
                else
                    render json: {
                        status: 'ERROR',
                        data: favorite.errors
                    }
                end
            end
        
            def destroy
                favorite = Favorite.find_by(item_id: params[:item_id], member_id: params[:member_id])
				if favorite.destroy
					render json: {
                        status: 'SUCCESS',
                        data: favorite
					}
                else
                    render json: {
                        status: 'ERROR',
                        data: favorite.errors
                    }
                end
            end

			private

			def set_member
				@member = Member.find(params[:member_id])
			end
        end
    end
end
