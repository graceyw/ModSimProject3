function res = tennisball_ode45(v,theta)
%INITIAL CONDITIONS
    x = 0; %m
    y = 2.5; %m
    vx = v * cosd(theta); %m/s
    vy = v * sind(theta); %m/s
    
    initials = [x ; y ; vx ; vy];
    timescale = [0 ; 10];
    
     options = odeset('Events',@tennisball_events);
    
    [~,S] = ode45(@tennisball_flows,timescale,initials,options);
    
    res = S(end);
    
     X = S(:,1);
     Y = S(:,2);
     comet(X,Y)
     title('Tennis Ball Position over 10 seconds');
     xlabel('X Position')
     ylabel('Y Position')
end