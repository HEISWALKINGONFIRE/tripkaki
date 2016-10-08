class Package < ActiveRecord::Base

	belongs_to :user
	has_many :private_reservations
	has_many :public_reservations

	scope :sorted_by, -> (sort) {order(sort)}
	scope :search_query, -> (query) {where('title LIKE ?', "%#{query}")}

	filterrific(
	  default_filter_params: { sorted_by: 'created_at_desc' },
	  available_filters: [
	    :sorted_by,
	    :search_query,
	  ]
	)
end
