class RoomsController < ApplicationController
  # ついでにRoom一覧を表示させるアクションも追加しておく
  def index
    @rooms = Room.all.order(:id)
  end
  
  def show
    # メッセージ一覧を取得
    @messages = Message.all
  end
end
