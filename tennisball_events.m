function [value,isterminal,direction] = tennisball_events(~,Q)
x = Q(1);
y = Q(2);

%value = [y ; x-11.89]; %stop when it hits the ground or when ball is out of court
value = [y ; x];
isterminal = [1 ; 1];
direction = [0 ; 0];
end