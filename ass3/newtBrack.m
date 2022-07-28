%Part d)
function [ok, xnewt] = newtBrack(a, b, x, fx, fpx)
xnewt = x-(fx/fpx);
if(xnewt>=a && xnewt<=b)
    ok = 1;
else
    ok =0;
end
end