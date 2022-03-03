# README
<%= appointment.input :doctor_id, :collection => Doctor.all,:label_method => :name,:value_method => :id,:label => "Doctor" ,:include_blank => false %>

has_many :through association 
nested form attributes 
patient k form mn nested (Appointments) form put kiya hai.
--ISSUES--
nested form edit nai ho raha tha..
solution:
appointments_attributes mn id param miss tha (:id)