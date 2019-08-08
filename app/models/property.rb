class Property < ApplicationRecord
	belongs_to :human

	has_one_attached :visual
	has_many_attached :multiView
end
