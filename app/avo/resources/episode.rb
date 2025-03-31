class Avo::Resources::Episode < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  
  def fields
    field :id, as: :id
    field :name, as: :text
    field :duration, as: :number
    field :slug, as: :text
    field :published_at, as: :date_time
  end
end
