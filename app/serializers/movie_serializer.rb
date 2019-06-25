class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title_type, :title, :plot, :created_at

  def title_type
    'episode'
  end

end
