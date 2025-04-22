% File: plot_UserPositionVelocity.m
% Description: Plots the BS location, UE location, and UE velocity vector

% 1. Load dataset (adjust indices as needed)
bs_loc        = DeepMIMO_dataset{3}.loc;              % [x, y, z] of BS 3
ue_loc        = DeepMIMO_dataset{3}.user{1}.loc;      % [x, y, z] of UE 1
dir_angles    = DeepMIMO_dataset{3}.user{1}.path_params.travel_dir;  % [azimuth; elevation] in degrees
speed_kmh     = DeepMIMO_dataset{3}.user{1}.path_params.velocity;    % speed in km/h



% 2. Convert speed to m/s
speed_ms = speed_kmh / 3.6;   % 1 km/h = 1/3.6 m/s

%    Note: The speed is given in km/h, so we convert it to m/s for calculations
%    and plotting. The conversion factor is 1 km/h = 1/3.6 m/s.
%    The speed is used to calculate the velocity vector of the UE in 3D space.
%    The speed is assumed to be constant in this example, but in a real-world
%    scenario, the speed may vary due to various factors such as terrain,       


% 3. Convert angles from degrees to radians
az_rad = deg2rad(dir_angles(1));   % azimuth in radians :contentReference[oaicite:0]{index=0}
el_rad = deg2rad(dir_angles(2));   % elevation in radians :contentReference[oaicite:1]{index=1}

%    weather, and user behavior. The velocity vector is used to represent the
%    direction and speed of the UE's movement in 3D space.
%    The azimuth and elevation angles are used to calculate the direction of
%    the velocity vector in 3D space. The azimuth angle is the angle in the
%    horizontal plane, while the elevation angle is the angle above the
%    horizontal plane. The angles are converted from degrees to radians for
%    calculations. The azimuth angle is measured clockwise from the +x axis,
%    while the elevation angle is measured from the horizontal plane. The
%    angles are used to calculate the unit direction vector of the velocity
%    vector in 3D space. The unit direction vector is then scaled by the                


% 4. Build unit‐direction vector in Cartesian coordinates
%    x = cos(el)*cos(az), y = cos(el)*sin(az), z = sin(el)
ux = cos(el_rad) * cos(az_rad);    % unit‐vector X component :contentReference[oaicite:2]{index=2}
uy = cos(el_rad) * sin(az_rad);    % unit‐vector Y component :contentReference[oaicite:3]{index=3}
uz = sin(el_rad);                  % unit‐vector Z component :contentReference[oaicite:4]{index=4}

%    The unit direction vector is calculated using the azimuth and elevation
%    angles. The unit direction vector is a vector with a magnitude of 1 that
%    points in the direction of the UE's movement. The unit direction vector is
%    calculated using the cosine and sine functions. The x component of the
%    unit direction vector is calculated using the cosine of the elevation
%    angle multiplied by the cosine of the azimuth angle. The y component is
%    calculated using the cosine of the elevation angle multiplied by the
%    sine of the azimuth angle. The z component is calculated using the sine
%    of the elevation angle. The unit direction vector is used to represent
%    the direction of the UE's movement in 3D space. The unit direction vector
%    is then scaled by the speed to get the velocity vector. The velocity
%    vector is a vector that represents the speed and direction of the UE's
%    movement in 3D space. The velocity vector is calculated by multiplying
%    the unit direction vector by the speed. The velocity vector is used to
%    represent the speed and direction of the UE's movement in 3D space. The
%    velocity vector is a vector that points in the direction of the UE's
%    movement and has a magnitude equal to the speed of the UE. The velocity
%    vector is used to represent the speed and direction of the UE's movement
%    in 3D space. The velocity vector is a vector that points in the
%    direction of the UE's movement and has a magnitude equal to the speed of
%    the UE. The velocity vector is used to represent the speed and direction
%    of the UE's movement in 3D space. The velocity vector is a vector that
%    points in the direction of the UE's movement and has a magnitude equal to
%    the speed of the UE. The velocity vector is used to represent the speed
%    and direction of the UE's movement in 3D space. 


% 5. Scale by speed to get velocity vector [vx; vy; vz]
v_xyz = speed_ms * [ux; uy; uz];

% 6. Plot BS, UE, and velocity arrow
figure;
scatter3(bs_loc(1), bs_loc(2), bs_loc(3), 100, 'bo', 'LineWidth', 1.5); 
hold on;
scatter3(ue_loc(1), ue_loc(2), ue_loc(3), 100, 'rx', 'LineWidth', 1.5);
% quiver3: arrows at (X,Y,Z) with components (U,V,W) :contentReference[oaicite:5]{index=5}
quiver3(ue_loc(1), ue_loc(2), ue_loc(3), ...
        v_xyz(1),  v_xyz(2),  v_xyz(3), ...
        1, 'k', 'LineWidth', 1.2, 'MaxHeadSize', 0.5);
grid on; axis equal;
xlabel('x (m)'); ylabel('y (m)'); zlabel('z (m)');
legend('BS location','UE location','UE velocity','Location','best');
title('BS & UE Positions with UE Velocity Vector');
