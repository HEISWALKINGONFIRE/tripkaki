class Package < ActiveRecord::Base

	belongs_to :user
	has_many :private_reservations
	has_many :public_reservations

	scope :tour_type, -> (tour) {
		case tour.to_s
		when /private/
			@private = true
			all
		when /public/
			@private = false
			joins(:public_reservations).select("packages.*, public_reservations.id as public_id, public_reservations.start_date, public_reservations.end_date, public_reservations.public_price")
		end
	}
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
	   order("LOWER(packages.title) #{ direction }")
	 when /^price_/
		 	if @private.nil? || !@private
	 			joins(:public_reservations).select("packages.*, public_reservations.id as public_id, public_reservations.start_date, public_reservations.end_date, public_reservations.public_price").order("public_reservations.public_price #{direction}") 
	 		else
	 			order("packages.private_price #{direction}")
	 		end
	 else
	   raise(ArgumentError, "Invalid sort option: #{ sort.inspect }")
	 end
	}
	scope :search_query, -> (query) { 
		state = Carmen::Country.named("malaysia", fuzzy: true).subregions.named(query, fuzzy: true).code if Carmen::Country.named("malaysia", fuzzy: true).subregions.named(query, fuzzy: true)
		where(state: "#{state}")
	}
	scope :date_range, -> (range) {
		# byebug
		all if range == nil
		arr = range.split(" - ")
		sdate =  Date.strptime(arr[0], '%m/%d/%Y')
		edate =  Date.strptime(arr[1], '%m/%d/%Y')

		where('start_date <= ? AND end_date >= ?', edate, sdate)
	}
	scope :price_range, ->(range) { 
		arr = range.to_s.split("-")
		min = arr[0].to_i
		max = arr[1].to_i
		# byebug
		if @private.nil? || !@private
 			joins(:public_reservations).select("packages.*, public_reservations.id as public_id, public_reservations.start_date, public_reservations.end_date, public_reservations.public_price").where("public_reservations.public_price <= #{max} AND public_reservations.public_price >= #{min}")
 		else
 			where(private_price: min..max)
 		end
	}
	
	filterrific(
	  default_filter_params: { sorted_by: 'created_at_desc' },
	  available_filters: [
	  	:tour_type,
	    :sorted_by,
	    :search_query,
	    :date_range,
	    :price_range
	  ]
	)

	self.per_page = 15

	def self.options_for_sorted_by
    [
    	['Created at', 'created_at_asc'],
      ['Name (AZ)', 'name_asc'],
      ['Name (ZA)', 'name_desc'],
      ['Price (Low to High)', 'price_asc'],
      ['Price (High to Low)', 'price_desc']

     ]
  end

  def self.options_for_tour_type
  	[
  		['Private', 'private'],
  		['Public', 'public']
  	]
  end


  def country_name
  	Carmen::Country.coded(self.country).name
	end

 	def state_name
 		Carmen::Country.coded(self.country).subregions.coded(self.state).name
 	end
end
