module Api
	module V1       
		class ItemsController < ApplicationController
			before_action :set_member, only: [:create]
			before_action :set_item, only: [:show, :destroy, :update]

			def index
				items = Item.all
				render json: {
					status: 'SUCCESS',
					message: 'Loaded items',
					data: items
				}
			end

			def show
				render json: {
					status: 'SUCCESS',
					message: 'Loaded item',
					data: @item
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

			private

			def set_member
				@member = Member.find(params[:id])
			end

			def set_item
				@item = Item.find(params[:id])
			end
		end
	end
end
