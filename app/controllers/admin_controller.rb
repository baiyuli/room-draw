class AdminController < ApplicationController

  # MAP PAGE

  def map
    puts "MAP!!!!!"
  end

  def edit_mark
    puts "editing mark", @admin, "wat"
    puts "DORM", @dorm
    if params[:delete]
      delete_mark(params)
    else
      add_mark(params)
    end
    # Refresh the page so the form can be used again.
    puts "LOC", root_path
    redirect_back fallback_location: root_path, success_message: "hello world"
  end

  def add_mark(params)
    @marked_room = RoomAssignment.new
    @marked_room.assignment_type = params[:mark_type]
    @marked_room.room_id = get_room(params[:dorm_name][:value], params[:room])
    @marked_room.description = params[:description]
    
    if @marked_room.save
      flash[:success] = "Room successfully marked unpullable."
    else
      flash[:danger] = "Error marking room unpullable."
    end
  end

  def delete_mark(params)
    # Look up the room with the corresponding room ID
    room_id = get_room(params[:dorm_name][:value], params[:room])
    if room_id.nil?
      flash[:success] = "Error - room not found."
    else
      # Delete all rooms with this room_id
      RoomAssignment.where(room_id: room_id).destroy_all
      flash[:success] = "All room assignments associated with this room were successfully deleted."
    end
  end

  def get_room(dorm, room_num)
    dorm_id = Dorm.find_by name: dorm
    room = Room.find_by dorm: dorm_id, number: room_num
    if room.nil?
      return nil
    end
    return room.attributes['id']
  end

  # INDIIVDUAL DORM MAPS

  def choose_room
    puts "AWWWW YEAH!"
    puts params
    @room_num = params[:roomNum]
    @status = params[:status]
    @type = params[:type]
    @dorm = params[:dorm]
    puts "DORM", @dorm, @room_num
  end

  def case
    puts "CASE IS THE PLACE"
    @admin = true
    @dorm = "dorm"
    @room_num = "room_num"
    render "dorms/case"
  end # TODO: GET RID OF THIS?

end