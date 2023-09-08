clear 

stefan_boltzmann_constant = 5.67 * 10^(-8);
albedo_factor = 0.35;
solar_constant = 1354;
absorptivity = 1; % assuming a black body - taken from online resource
emissivity = 0.9;
area_surface = 0.01;
altitude = 500;
earth_radius = 6378;
angle = 0;

incident_angle = 0:1:180;

count = 1;

for i = 1:181
  view_factor = (altitude + earth_radius)/earth_radius;
   angle = angle + 1 

heat_IR_temperature = stefan_boltzmann_constant * emissivity * view_factor * area_surface * 255^4;
heat_ir_flux = emissivity * area_surface * view_factor * solar_constant;
heat_albedo= absorptivity * area_surface * albedo_factor * view_factor * solar_constant;
solar_heat = absorptivity * area_surface * solar_constant * cosd(angle);

h_out = heat_albedo + solar_heat + heat_ir_flux + heat_IR_temperature;
temperature(count) = (h_out/(area_surface * emissivity * stefan_boltzmann_constant))^(0.25);

   count=count+1;
end 



% Code chunk for plotting points
plot (incident_angle,temperature);
title("Steady State Temperature at different incident Angles")
xlabel("Incident Angle (degrees)");
ylabel("Temperature (kelvin)");

