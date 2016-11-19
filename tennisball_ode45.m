function res = tennisball_ode45(v,theta)
%INITIAL CONDITIONS
    x = 0; %m
    
    roger_height = 1.85; %m
    racket_height =  0.69; %m 
    y = roger_height + racket_height; %m
    
    vx = v * cosd(theta); %m/s
    vy = v * sind(theta); %m/s
    
    initials = [x ; y ; vx ; vy];
    timescale = [0 ; 20];
    options = odeset('Events',@tennisball_events); 
    [~,S] = ode45(@tennisball_flows,timescale,initials,options);
    X = S(:,1);
    Y = S(:,2);
    res = Y(end);
    %comet(X,Y)
    %vline (11.89,'g'); %net x
    %hline (0.914,'g'); %net y
    %vline (18.29,'r'); %fault
    %title('Tennis Ball Position over 10 seconds');
    %xlabel('X Position')
    %ylabel('Y Position')
end