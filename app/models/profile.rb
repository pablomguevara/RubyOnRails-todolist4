

class Profile < ActiveRecord::Base
    belongs_to :user

    validates :gender, inclusion: ["male", "female"]

    validate :profile_name_lastname_validation, :male_not_sue

    def profile_name_lastname_validation
        if first_name.nil? and last_name.nil?
            errors.add(:first_name, "Name and Lastname cannot both be nil")
            errors.add(:last_name, "Name and Lastname cannot both be nil")
        end
    end

    def male_not_sue
        if gender == "male"
            if first_name == "Sue"
                errors.add(:first_name, "Male can not be named Sue")
            end
        end
    end

    # Add a **class** method to the `Profile` class, called `get_all_profiles`, which:
    # * accepts a min and max for the `birth year`
    # * issues a `BETWEEN` SQL clause in a `where` clause to locate `Profiles` 
    # with birth years that are between min year and max year 
    # * defends itself against SQL injection when applying the parameters to the SQL clauses
    # * returns a collection of Profiles in ASC birth year order
    scope :get_all_profiles, -> (min, max){
    	where("birth_year BETWEEN :min AND :max", :min => min, :max => max).order(birth_year: :asc)
    }

end
