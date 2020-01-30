# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :description, presence: true
end
