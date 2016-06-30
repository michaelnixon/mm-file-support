class DataTrackDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegators :@view, :link_to,:data_track_path, :truncate
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['DataTrack.name','DataTrack.description', 'Take.name','Take.description']
  end
  #name, take, project, sensors, movers, technician, recording data, tags
  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['DataTrack.name','DataTrack.description', 'Take.name','Take.description']
  end
# project.name, taglist
  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        link_to(truncate(record.name, length: 40), data_track_path(record),class:"underlined"), record.description, record.take.try(:name), record.take.try(:description)      
      ]
    end
  end

  def get_raw_records
    # update later to include filtering
    @data_tracks = DataTrack.where(public:true).includes(:take).references(:take).distinct
    # if @current_user
    #   @data_tracks.select! { |data_track| data_track.public? or data_track.is_accessible_by?(@current_user)  }
    # else
    #   @data_tracks.select! { |data_track| data_track.public? }
    # end
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
