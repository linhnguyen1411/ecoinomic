class Stage < ApplicationRecord
  enum stage_type: {subcrible: 1, register: 2, buy_coin: 3, ended: 4}

  validates :stage_type, presence: true

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
end
