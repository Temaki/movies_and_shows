class Episode < ApplicationRecord

  acts_as_list column: :number, scope: :season

  belongs_to :season

end
