module OpportunitiesHelper
    def build_opportunities_object_from_params(params)
        code = []
        code << '1' if params[:search_title].present?
        code << '2' if params[:search_category].present?
        code << '3' if params[:search_location].present?
    
        code = code.join('')
    
        case code
        when '1'
            Opportunity.where('LOWER(name) LIKE ?', "%#{params[:search_title].to_s.downcase}%").paginate(page: params[:page], per_page: 7)
        when '2'
            Opportunity.where('LOWER(category) LIKE ?', "%#{params[:search_category].to_s.downcase}%").paginate(page: params[:page], per_page: 7)
        when '3'
            Opportunity.where('LOWER(location) LIKE ?', "%#{params[:search_location].to_s.downcase}%").paginate(page: params[:page], per_page: 7)
        when '12'
            Opportunity.where('LOWER(name) LIKE ? AND LOWER(category) LIKE ?', "%#{params[:search_title].to_s.downcase}%", "%#{params[:search_category].to_s.downcase}%").paginate(page: params[:page], per_page: 7)
        when '13'
            Opportunity.where('LOWER(name) LIKE ? AND LOWER(location) LIKE ?', "%#{params[:search_title].to_s.downcase}%", "%#{params[:search_location].to_s.downcase}%").paginate(page: params[:page], per_page: 7)
        when '23'
            Opportunity.where('LOWER(category) LIKE ? AND LOWER(location) LIKE ?', "%#{params[:search_category].to_s.downcase}%", "%#{params[:search_location].to_s.downcase}%").paginate(page: params[:page], per_page: 7)
        when '123'
            Opportunity.where('LOWER(name) LIKE ? AND LOWER(category) LIKE ? AND LOWER(location) LIKE ?', "%#{params[:search_title].to_s.downcase}%", "%#{params[:search_category].to_s.downcase}%", "%#{params[:search_location].to_s.downcase}%").paginate(page: params[:page], per_page: 7)
        else
            Opportunity.paginate(page: params[:page], per_page: 7)
        end
    end
end
