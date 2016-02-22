class TakeDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari
  def_delegators :@view, :link_to, :sensor_type_path, :mover_path, :take_path, :truncate
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    #@sortable_columns ||= ['Take.name', 'Movement_Group.name', 'SensorType.name', 'Mover.name', 'DataTrack.technician', 'DataTrack.recorded_on']
    @sortable_columns ||= ['Take.name','MovementGroup.name', 'Mover.name']
  end
  #name, take, project, sensors, movers, technician, recording data, tags
  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    #@searchable_columns ||= ['Take.name', 'Movement_Group.name', 'SensorType.name', 'Mover.name', 'DataTrack.technician', 'DataTrack.recorded_on']
    @searchable_columns ||= ['Take.name', 'MovementGroup.name', 'Mover.name']
  end

# project.name, taglist
  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        #link_to(truncate(record.name, length: 40), take_path(record),class:"underlined")
        link_to(record.name, take_path(record),class:"underlined"),  record.movement_group.try(:name), record.movement_group.try(:description),record.movers.map{|mover| link_to(mover.name, mover_path(mover),class:"underlined") }.join(", ")
        #record.sensor_types.map{|type| link_to(type.name, sensor_type_path(type),class:"underlined") }.join(", ")
        #record.movement_group_url,
        #, record.take.try(:name), record.sensor_types.map{|type| link_to(type.name, sensor_type_path(type),class:"underlined") }.join(", "), record.movers.map{|mover| link_to(mover.name, mover_path(mover),class:"underlined") }.join(", "),
          #record.technician, record.recorded_on, record.tag_list
      ]
    end
  end

  def get_raw_records
    # update later to include filtering
    @take = Take.all.includes(:movement_group, :movers).references(:movement_group, :movers).distinct
    if @current_user
      @take.select! { |take| take.public? or take.is_accessible_by?(@current_user)  }
    else
      @take.select! { |take| take.public? }
    end
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
