function [ret] = block_apply_dct(data, dim)
%BLOCK_APPLY_DCT Apply DCT to (dim x dim) block of image rep by data matrix

ret = zeros(size(data));

alpha = @(x, Y) (x==0)*(1/sqrt(Y)) + (x~=0)*(sqrt(2/Y));
expr = @(data, m, n, p, q) data(m+1, n+1) * cos(pi * (2*m+1) * p / (2*dim)) * cos(pi * (2*n+1) * q / (2*dim));

for p = 0 : dim - 1
    for q = 0 : dim - 1
        sum = 0;
        for m = 0 : dim - 1
            for n = 0 : dim - 1
                sum = sum + expr(data, m, n, p, q);
            end
        end
        ret(p+1, q+1) = alpha(p, dim) * alpha(q, dim) * sum;
    end
end

end