class GroupRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:new, :create, :groupchat, :edit, :update, :destroy]
  before_action :set_group_room, only: [:edit, :update]

    def index
        @group_room_lists = GroupRoom.all.page(params[:page]).per(10)
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
    
    def groupchat #チャット用
        @group_chat = current_user.group_chats.new(group_chat_params)
            render :validater unless @group_chat.save
    end

    def show
        @group_room = GroupRoom.find(params[:id])
        
        @group_chats = @group_room.group_chats #チャット用
        @group_chat = GroupChat.new(group_room_id: @group_room.id)
        
        @users = @group_room.users
    end

    def edit
        @group_room = GroupRoom.find(params[:id])
    end

    def update
        @group_room = GroupRoom.find(params[:id])
        if @group_room.update(group_room_params)
            redirect_to group_rooms_path, notice: 'Group updated'
        else
            render :edit
        end
    end

    def destroy
        delete_group_room = GroupRoom.find(params[:id])
        if delete_group_room.destroy
            redirect_to group_rooms_path, notice: 'Group deleted'
        end
    end

    private
        def set_group_room
            @group_room = GroupRoom.find(params[:id])
        end

        def group_room_params
            params.require(:group_room).permit(:name, user_ids: [])
        end
        
        def group_chat_params #チャット用
            params.require(:group_chat).permit(:message, :group_room_id)
        end
        
        def ensure_guest_user
            if current_user.email == "guest@example.com"
              redirect_to root_path , notice: "ゲストユーザーはこの機能はご使用いただけません。"
            end
        end  
        

end
