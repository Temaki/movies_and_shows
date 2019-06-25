class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :number, :title, :plot, :created_at


end
