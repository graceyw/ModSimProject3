function [value,isterminal,direction] = tennisball_events(~,Q)
x = Q(1);
y = Q(2);
        value = [y ; x-23.77]; %stop when it hits the ground or when ball is out of court
        isterminal = [1 ; 1];
        direction = [0 ; 0];
end