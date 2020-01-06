module UserAssociatedLifecycle
  def save_associatied_account(account_type, account_user_id)
    case account_type
    when 'student'
        associated_student = Student.new(user_id: account_user_id)
        associated_student.save!
    when 'business'
        associated_employer = Employer.new(user_id: account_user_id)
        associated_employer.save!
        associated_business = Business.new(employer_id: associated_employer.id)
        associated_business.save!
    when 'moderator'
        associated_business = Employer.new(user_id: account_user_id)
        associated_business.save!
    else
        associated_admin = Employer.new(user_id: account_user_id)
        associated_admin.save!
    end
  end
end
