function [mse] = calc_mse(orig, comp)
%CALC_MSE Calcute MSE using original and compressed images

s = size(orig);
mse = double(0);
o_d = im2double(orig);
c_d = im2double(comp);
for c = 1 : s(3)
    mse_ = double(0);
    for m  = 1 : s(1)
        for n = 1 : s(2)
            mse_ = mse_ + (o_d(m, n, c) - c_d(m , n, c))^2;
        end
    end
    mse_ = mse_ / (s(1) * s(2));
    mse = mse + mse_;
end
mse = mse / 3;

end