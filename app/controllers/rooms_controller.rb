class RoomsController < ApplicationController
  # ついでにRoom一覧を表示させるアクションも追加しておく
  def index
    @rooms = Room.all.order(:id)
  end
  
  def show
    # メッセージ一覧を取得
    #@messages = Message.all オープンチャット用
    #room別用
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def create
    Room.create
    @rooms = Room.all.order(:id)
    #render action: :index
    redirect_to root_path
  end
  
end
