class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :title_type, :title, :plot, :created_at
  has_many :episodes

  def title_type
    'season'
  end

end
