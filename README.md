# README
<%= appointment.input :doctor_id, :collection => Doctor.all,:label_method => :name,:value_method => :id,:label => "Doctor" ,:include_blank => false %>

has_many :through association 
nested form attributes 
patient k form mn nested (Appointments) form put kiya hai.
--ISSUES--
nested form edit nai ho raha tha..
SOLUTION:
appointments_attributes mn id param miss tha (:id)..

--ISSUES--
How was to, when we want to add miltiple appoinments at the same time

SOLUTION:
_destroy.

helper method as link_to_add_appointment.
def link_to_add_appointments(name, appointment, association)
    new_object = appointment.object.send(association).klass.new
    id = new_object.object_id
    appointments = appointment.fields_for(association, new_object, child_index: id) do |build|
        render( 'appointment_fields', appointment: build)
    end
    link_to(name, "#", class: 'add_appointments btn btn-outline-success btn-sm float-end', data: {id: id, appointments: appointments.gsub("\n", "")})
end

and button for it:
<%= link_to_add_appointments "Add Appointment", f, :appointments%><br>

and jquery code for it:
$('form').on('click', '.add_appointments', function(event){
    console.log('clicked');     
    var regexp, time;
     time = new Date().getTime();
     regexp= new RegExp($(this).data('id'), 'g');
     $(this).before($(this).data('appointments').replace(regexp, time));
     return event.preventDefault();
 });

and for removing: 

add Jquery code:
$('form').on('click', '.remove-appointments', function(event){
    console.log('remove'); 
   $(this).prev('input[type=hidden]').val('1');
   $(this).closest('fieldset').hide();
   return event.preventDefault();

});

and add remove button:
<%= link_to "Click To Remove", "", class: "remove-appointments btn btn-outline-danger btn-sm float-end"%> <br>
