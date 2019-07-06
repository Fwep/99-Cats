# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = %w(black tabby white blue chocolate cinnamon lilac lavender red sable brown cream).freeze

  validates :birth_date, presence: true
  validates :color, presence: true, inclusion: COLORS
  validates :name, presence: true, uniqueness: true
  validates :sex, presence: true, inclusion: %w(M F)
  validates :description, presence: true

  def age
    time_ago_in_words(birth_date)
  end 
end
