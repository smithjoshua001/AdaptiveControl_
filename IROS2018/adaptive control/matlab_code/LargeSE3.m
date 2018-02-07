function T = LargeSE3(w,v)
% w = screw(1:3);
% v = screw(4:6);
wsqr = w.'*w;
wnorm = sqrt(wsqr);
wnorm_inv = 1/wnorm;
cw = cos(wnorm);
sw = sin(wnorm);

if wnorm > eps
    W = [0 -w(3) w(2);w(3) 0 -w(1);-w(2) w(1) 0];

    P = eye(3) + (1-cw)*wnorm_inv^2*W + (wnorm - sw)*wnorm_inv^3 * W^2;
    T = [LargeSO3(w) P*v; zeros(1,3) 1];
else
    T = [eye(3) v; zeros(1,3) 1];
end


