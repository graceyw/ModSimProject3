angle = -10:0.5:10;
speed = 50:0.5:70;
numAngle = length(angle);
numSpeed = length(speed);
height = zeros(numAngle, numSpeed);
for i=1:numSpeed
    for j=1:numAngle
        height(i,j) = tennisball_ode45(speed(i),angle(j));
    end
end
pcolor (angle, speed, height);
colorbar;
hold on;

contour (angle, speed, height, [0.914 0.914],'r');
xlabel ('angle (degrees)');
ylabel ('speed (m/s)');
title ('The height of the ball over the net');

