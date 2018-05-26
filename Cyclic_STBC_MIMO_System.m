clc;
close all;

%Initialising the parameters
Mt = 2;
T = 2;

L = input('Enter the value of L: ');

%Setting the in initial values of u1 and u2

increment_factor = input('Enter the increment factor of u parameter: ');

u1 = 0:increment_factor:L-1;
u2 = 0:increment_factor:L-1;
l_u1 = length(u1);
i = 0;

U_matrix = zeros([(length(u1)*length(u2)) 2]);

% Iterating through the limit and finding all the values of u1 and u2 and
% storing them in the U matrix
for x = u1
    for y = u2
         i = i + 1;
         U_matrix(i,1) = x;
         U_matrix(i,2) = y;
    end
end

% Calculating the gain for all the combinations of u

% The outer 1 to l-1 iteration
for l = 1:L-1   
% Checking for all the possible combinations    
    for j = 1:(l_u1^Mt) 
            t = sin((U_matrix(j,:)*l*pi)/L);
            gain(l,j) = (abs(prod(t)))^(1/Mt);  
    end
end

% Finding the normalized coding gain
gain;
gou = min(gain)
normal_gain = max(gou)

% Identifying the optimal values of u1 and u2
k = 0;
for l = 1:L-1
    for j = 1:(l_u1^Mt)
        if(gain(l,j) == normal_gain)
            u_otm = U_matrix(j,:);
            k = k+1;
            break
        end
    end
        if k == 1
        break
        end
end

% Optimum u parameters
u_otm