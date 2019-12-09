module ApplicationHelper
    def current_class?(test_path)
        return ' border-b-2 border-green-500 hover:border-green-700' if request.path == test_path
        ''
    end

    def build_notifications
        return if !logged_in?
        user_notifications = {}
        user_types = get_current_user_roles.select { |type| type == 'employer' || type == 'student' }
        user_types.each do |type|
            key = 'edit_' + type + '_path'
            type_object = 'current_' + type
            value = ['Please edit your '+ type +' profile if you are yet to do so.', send(type_object).id]
            user_notifications[key] = value
        end
        return user_notifications
    end

    def build_business_notifications
        return if !logged_in?
        business_notifications = {}
        user_types = get_current_user_roles.select { |type| type == 'employer' || type == 'student' }

        if user_types.include?('employer') && !current_employer.businesses.present?
            business_notifications['new_business_path'] = 'Please list your business'
        end
        return business_notifications
    end

    def notifications
        all_notifications = {}
        all_notifications['profile_notifications'] = build_notifications
        all_notifications['business_notifications'] = build_business_notifications if current_employer
        return all_notifications
    end
end
