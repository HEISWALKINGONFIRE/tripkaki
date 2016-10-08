class Package < ActiveRecord::Base

	belongs_to :user
	has_many :private_reservations
	has_many :public_reservations

	scope :sorted_by, -> (sort) {
		direction = (sort =~ /desc$/) ? 'desc' : 'asc'
	 case sort.to_s
	 when /^created_at_/
	   # Simple sort on the created_at column.
	   # Make sure to include the table name to avoid ambiguous column names.
	   # Joining on other tables is quite common in Filterrific, and almost
	   # every ActiveRecord table has a 'created_at' column.
	   order("packages.created_at #{ direction }")
	 when /^name_/
	   # Simple sort on the name colums
	   order("LOWER(packages.title) #{ direction }, LOWER(packages.title) #{ direction }")
	 else
	   raise(ArgumentError, "Invalid sort option: #{ sort.inspect }")
	 end
	}
	scope :search_query, -> (query) {where('LOWER(title) LIKE ?', "#{query}%")}

	filterrific(
	  default_filter_params: { sorted_by: 'created_at_desc' },
	  available_filters: [
	    :sorted_by,
	    :search_query,
	  ]
	)

	self.per_page = 15

	def self.options_for_sorted_by
    [
    	['Created at', 'created_at_asc'],
      ['Name (AZ)', 'name_asc'],
      ['Name (ZA)', 'name_desc']
     ]
  end
end
