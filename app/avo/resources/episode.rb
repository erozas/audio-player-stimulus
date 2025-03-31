class Avo::Resources::Episode < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  self.find_record_method = -> {
    begin
      Episode.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      Episode.find(params[:id])
    end
  }

  def fields
    field :id, as: :id
    field :name, as: :text
    field :duration, as: :number, show_on: [:index, :show, :edit]
    field :slug, as: :text
    field :audio, as: :file
    field :published_at, as: :date_time
  end
end
