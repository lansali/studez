module UsersHelper
    def build_user_params(user_params, user_type_param)
        settings = {}
        bool_flag = user_type_param == 'true'
        settings[:privacy] =  bool_flag ? 'y' : 'n'
        settings[:account_type] = bool_flag ? 'business' : 'student'
        user_params.merge({ "settings": settings })
    end
end
