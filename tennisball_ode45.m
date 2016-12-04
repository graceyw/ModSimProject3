function res = tennisball_ode45(velocity,theta,rpm)
%INITIAL CONDITIONS
    x = 0; %m
    
    roger_height = 1.85; %m
    racket_height =  0.69; %m 
    y = roger_height + racket_height; %m
    
    vx = velocity * cosd(theta); %m/s
    vy = velocity * sind(theta); %m/s
    
    
    initials = [x ; y ; vx ; vy; rpm];
    timescale = [0 ; 20];
    options = odeset('Events',@tennisball_events); 
    [~,S] = ode45(@tennisball_flows,timescale,initials,options);
    X = S(:,1);
    Y = S(:,2);
    res = Y(end);
    hold on;
    axis ([0 23.77 0 y+0.5]);
    comet(X,Y)
    vline (11.89,'g'); %net x
    hline (0.914,'g'); %net y
    vline (18.29,'r'); %fault
    title('Tennis Ball Position over 10 seconds');
    xlabel('X Position')
    ylabel('Y Position')
end