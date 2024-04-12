function [W_OWA]=weights_solving(alpha)
%This function computes the values of the different weights according to a
%fusion at 3 or 4 estimators

clc
close all

%%
%--- 3 weights ---%

% alpha = 0.725;

Max = 0;

for w1 = 0:0.0001:1
        w3=2-2*w1-2*alpha;%%% it was 3*alpha-2*w1
        w2=2*alpha-1+w1;%%% it was 3*alpha-2*w1
        z=-(w1*log(w1)+w2*log(w2)+w3*log(w3));
        if(imag(z)==0)
            if(z>Max)
                Max = z;
                w1_opt = w1;
                w2_opt = w2;
            end
        end
end

Max;
w1_opt;
w2_opt;
w3_opt = 1-w1_opt-w2_opt;
W_OWA=[w1_opt w2_opt w3_opt];


end

