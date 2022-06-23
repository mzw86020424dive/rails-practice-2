module Api
	module V1       
		class ItemsController < ApplicationController
			before_action :set_member, only: [:create, :index, :is_favorited_by]
			before_action :set_item, only: [:show, :destroy, :update, :is_favorited_by, :favorite_members]

			def index
				items = @member.items
				render json: {
					status: 'SUCCESS',
					message: 'Loaded items',
					data: items
				}
			end

			def show
				@member = @item.member
				render json: {
					status: 'SUCCESS',
					message: 'Loaded item',
					data: {
						item: @item,
						member: @member
					}
				}
			end

			def create
				item = Item.new(
					name: params[:name],
					text: params[:text],
					member: @member
				)
				if item.save
					render json: {
                        status: 'SUCCESS',
                        data: item
					}
                else
                    render json: {
                        status: 'ERROR',
                        data: item.errors
                    }
                end
			end

			def destroy
				@item.destroy
				render json: {
                    status: 'SUCCESS', 
                    message: 'Deleted the item', 
                    data: @item
                } 
			end

			def update
				if @item.update(name: params[:name], text: params[:text])
                    render json: { 
						status: 'SUCCESS', 
						message: 'Updated the item', 
						data: @item 
					}
				else
						render json: { 
						status: 'SUCCESS', 
						message: 'Not updated', 
						data: @item.errors 
					}
				end
			end

			def is_favorited_by
				is_favorited_by = @item.favorited_by?(@member)
				render json: { 
					status: 'SUCCESS', 
					message: 'Loded favorite', 
					data: is_favorited_by
				}
			end

			def favorite_members
				favorite_members = @item.favorite_members
				render json: { 
					status: 'SUCCESS', 
					message: 'Loded favorite_members', 
					data: favorite_members
				}
			end

			private

			def set_member
				@member = Member.find(params[:member_id])
			end

			def set_item
				@item = Item.find(params[:item_id])
			end
		end
	end
end
