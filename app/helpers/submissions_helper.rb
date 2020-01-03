module SubmissionsHelper
    def save_associated_resume(resume_params)
        resume = Resume.new(resume_params)
        result = OpenStruct.new
        if resume.save
          result.has_errors = false
          result.resume = resume
        else
          result.has_errors = true
          result.resume = resume
        end
        return result
    end
end
