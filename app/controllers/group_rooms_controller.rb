class GroupRoomsController < ApplicationController
  before_action :set_group_room, only: [:edit, :update]

    def index
        @group_room_lists = GroupRoom.all
        @group_room_joining = GroupEntry.where(user_id: current_user.id)
        @group_room_lists_none = "グループに参加していません。"
    end

    
    def new
      @group_room = GroupRoom.new
      @group_room.group_entries.build(user: current_user)
    end

    def create
        @group_room = GroupRoom.new(group_room_params)
        if @group_room.save
            redirect_to group_rooms_path, notice: 'グループを作成しました。'
        else
            render :new
        end
    end

    def show
        @group_room = GroupRoom.find(params[:id])
    end

    def edit
        @group_room = GroupRoom.find(params[:id])
    end

    def update
        @group_room = GroupRoom.find(params[:id])
        if @group_room.update(group_room_params)
            redirect_to group_rooms_path, notice: 'グループを更新しました。'
        else
            render :edit
        end
    end

    def destroy
        delete_group_room = GroupRoom.find(params[:id])
        if delete_group_room.destroy
            redirect_to group_rooms_path, notice: 'グループを削除しました。'
        end
    end

    private
        def set_group_room
            @group_room = GroupRoom.find(params[:id])
        end

        def group_room_params
            params.require(:group_room).permit(:name, user_ids: [])
        end

end
