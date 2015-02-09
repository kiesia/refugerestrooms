ActiveAdmin.register Restroom do
  permit_params :name, :street, :city, :state, :accessible, :unisex, :directions,
                :comment, :latitude, :longitude, :country, :id

  controller do
    def show
      @restroom = Restroom.find(params[:id])
      @versions = @restroom.versions
      @restroom = @restroom.versions[params[:version].to_i].reify if params[:version]
      show!
    end
  end

  sidebar :proposed_updates, partial: "layouts/proposed_updates", only: :show
  sidebar :versions, partial: "layouts/version", only: :show

  member_action :history do
    @restroom = Restroom.find(params[:id])
    @versions = @restroom.versions
    render "layouts/history"
  end
end
