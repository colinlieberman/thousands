class Item < ApplicationRecord
  # TODO: factor into presenter
  include ActionView::Helpers::NumberHelper

  validates :name, presence: true
  validates :length_mm, presence: true

  default_scope { order("length_mm ASC") }

  def human_size
    number_to_human(length_mm)
  end

  def tenx
    relative_lookup(7, 13)
  end

  def hunx
    relative_lookup(70, 130)
  end

  class << self
    def less_than_100mm
      less_than_length_mm 100
    end

    def less_than_1000mm
      less_than_length_mm 1000
    end

    private

    def less_than_length_mm(length)
      Item.where("length_mm < ?", length)
    end
  end

  private

  def relative_lookup(min_multiple, max_multiple)
    Item.where("length_mm >= ? * ? AND length_mm <= ? * ?", min_multiple, length_mm, max_multiple, length_mm)
  end
end
