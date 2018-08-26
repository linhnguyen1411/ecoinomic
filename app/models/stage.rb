class Stage < ApplicationRecord

  # ATTR = [:stage_type, :start_register, :end_register, :end_subcrible, :start_subcrible,
  #   :end_ended, :start_date_1, :end_date_1, :coin_1, :coin_2, :start_date_2, :end_date_2]

  enum stage_type: {subcrible: 1, register: 2, buy_coin: 3, ended: 4}

  validates :stage_type, presence: true
  # validates  :start_subcrible, :end_subcrible, presence: true, if: :is_subcrible
  # validates  :start_register, :end_register, presence: true, if: :is_register
  # validates  :end_ended, presence: true, if: :is_ended
  validates  :start_date_1, :end_date_1, :coin_1, :coin_2, :start_date_2,
    :end_date_2, :progess, presence: true, if: :is_buy_coin

  class << self
    def enums_for_select name
      send(name).map do |key, _|
        {
          id: key,
          name: I18n.t("enum_label.#{name}.#{key}"),
          re_name: I18n.t("enum_label.#{name}.re_#{key}")
        }
      end
    end
  end

  private
  def is_buy_coin
    self.buy_coin?
  end

  def is_register
    self.register?
  end

  def is_subcrible
    self.subcrible?
  end

  def is_ended
    self.ended?
  end
end
