function res = tennisball_flows(~, Q)
    %CONSTANTS
    density_air = 1.225; %kg/m^3
    drag_coef = 0.5; %dimensionless
    area = 0.0335; %m^2 (cross-sectional area of ball; "how much air do I have to push out of the way?")
    mass_ball = 0.0585; %kg
    gravity = 9.8; %m/s^2

    x = Q(1);
    y = Q(2);
    vx = Q(3);
    vy = Q(4);

    %DIFFERENTIAL EQUATIONS
    deriv_x = vx;
    deriv_y = vy;
    deriv_vx = (-0.5 * density_air * drag_coef * area)/ (mass_ball) * (vx^2 + vy^2) * vx / (sqrt(vx^2 + vy^2));
    deriv_vy = -gravity - ((    0.5 * density_air * drag_coef * area * (vx^2 + vy^2) * vy / (sqrt(vx^2 + vy^2)))) / mass_ball;

    res = [deriv_x ; deriv_y ; deriv_vx ; deriv_vy];
end