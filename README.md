# README
<%= appointment.input :doctor_id, :collection => Doctor.all,:label_method => :name,:value_method => :id,:label => "Doctor" ,:include_blank => false %>