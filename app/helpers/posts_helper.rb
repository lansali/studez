module PostsHelper
    def build_posts_object_from_params(params)
        code = []
        code << '1' if params[:search_title].present?
        code << '2' if params[:search_author].present?
    
        code = code.join('')
    
        case code
        when '1'
            Post.where('LOWER(title) LIKE ?', "%#{params[:search_title].to_s.downcase}%").paginate(page: params[:page], per_page: 7)
        when '2'
            Post.where('LOWER(author) LIKE ?', "%#{params[:search_author].to_s.downcase}%").paginate(page: params[:page], per_page: 7)
        when '12'
            Post.where('LOWER(title) LIKE ? AND LOWER(author) LIKE ?', "%#{params[:search_title].to_s.downcase}%", "%#{params[:search_author].to_s.downcase}%").paginate(page: params[:page], per_page: 7)
        else
            Post.paginate(page: params[:page], per_page: 7)
        end
    end
end
