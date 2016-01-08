module ProjectsHelper
  def most_data_tracks
    current_most = 0
    @projects.each do |project|
      project.movement_groups.each do |group|
        if group.data_tracks.size > current_most
          current_most = group.data_tracks.size 
        end
      end
    end
    current_most
  end
  
  def group_link_or_name(group)
    if group.is_accessible_by?(current_user) or group.public?
      link_to(group.name, movement_group_path(group),"class='underlined'":String)
    else
      group.name
    end
  end
  
  def take_link_or_name(take)
    if take.is_accessible_by?(current_user) or take.public?
      #link_to(truncate(take.name, length: 40), take_path(take))
      link_to(take.name, take_path(take))
    else
      take.name
      #truncate(take.name, length: 40)
    end
  end  
  
  def mova_url
    #"http://www.sfu.ca/~oalemi/movan/"
    #"http://142.58.181.193:8080/index.php"
    #"http://142.58.181.193/MovAn/movan/index.php"
    "http://moda.movingstories.ca/Mova/index.php?"
  end
  
end
