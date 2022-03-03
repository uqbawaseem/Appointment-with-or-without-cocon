module ApplicationHelper

    def link_to_add_appointments(name, appointment, association)
        new_object = appointment.object.send(association).klass.new
        id = new_object.object_id
        appointments = appointment.fields_for(association, new_object, child_index: id) do |build|
            render( 'appointment_fields', appointment: build)
        end
        link_to(name, "#", class: 'add_appointments btn btn-outline-success btn-sm float-end', data: {id: id, appointments: appointments.gsub("\n", "")})
    end

end
