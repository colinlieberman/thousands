class ItemsController < ApplicationController
  before_action :set_item, only: [:lookup]

  def lookup
    type = params.require(:type)
    respond_to do |format|
      result = { requested: @item, found: @item.send(type) }
      format.json { render json: result }
    end
  end

  private

  def set_item
    @item ||= Item.find(params.require(:id))
  end
end
