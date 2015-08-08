class Article < ActiveRecord::Base
	#validates is a functionality that comes from the activeRecord::Base class, in this case we are validating that the presence of a title and body text is present and that are both atleast 5 charicters long
	validates :title, presence: true,
                    length: { minimum: 5 }
    validates :text, presence: true,
                    length: { minimum: 5 }
end
