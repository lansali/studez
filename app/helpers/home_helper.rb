module HomeHelper
    def build_featured_job_struct(query, category_open_positions)
        opportunity ||= query.order(created_at: :desc).first
        OpenStruct.new(
            :id => opportunity.id,
            :name => opportunity.name,
            :category => opportunity.category,
            :posted_on => opportunity.created_at,
            :posted_by => opportunity.business.employer.user.username,
            :location => opportunity.location,
            :deadline => opportunity.deadline,
            :category_open_positions => category_open_positions
        )
    end

    def build_job_by_location_array_struct
        distinct_locations ||= Opportunity.get_distinct_locations
        open_positions_in_location_array = []

        job_by_location_array_struct = distinct_locations.map do |location|
            open_positions_in_location_count ||= Opportunity.get_count_by_location(location)
            open_positions_in_location_array << open_positions_in_location_count
            OpenStruct.new(
            :location => location,
            :count => open_positions_in_location_count
            )
        end
        min_by_location = open_positions_in_location_array.sort.last(8).min
        job_by_location_array_struct.select { |struct| struct.count >= min_by_location }
    end

    def set_homepage_data
        distinct_categories ||= Opportunity.get_distinct_categories
        open_positions_array = []
        featured_jobs_array_struct = []
  
        categories_array_struct = distinct_categories.map do |category|
          query ||= Opportunity.where(category: category)
          open_positions = query.count
          featured_jobs_array_struct << build_featured_job_struct(query, open_positions)
          open_positions_array << open_positions
          OpenStruct.new(:name => category, :open_positions => open_positions)
        end
        min_feature = open_positions_array.sort.last(4).min
        min_popular = open_positions_array.sort.last(10).min
  
        @jobs_by_location = build_job_by_location_array_struct
        @featured_jobs = featured_jobs_array_struct.select { |struct| struct.category_open_positions >= min_feature }
        @popular_job_categories = categories_array_struct.select { |struct| struct.open_positions >= min_popular }
    end
end
