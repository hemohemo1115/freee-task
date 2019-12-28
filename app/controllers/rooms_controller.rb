class RoomsController < ApplicationController
  before_action :authenticate_user!

  # ついでにRoom一覧を表示させるアクションも追加しておく
  def index
    @rooms = Room.all.order(:id)
    @current_user = current_user
  end
  
  def show
    # メッセージ一覧を取得
    #@messages = Message.all オープンチャット用
    #room別用
    @room = Room.find(params[:id])
    @messages = @room.messages
    @current_user = current_user
  end

  def create
    Room.create
    @rooms = Room.all.order(:id)
    #render action: :index
    redirect_to root_path
  end
  
  #def current_user
  #  current_user
  #end
  

end
