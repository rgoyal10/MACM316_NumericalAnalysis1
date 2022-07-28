%part c) and part e)
function [root, iter, xlist] = newton( func, pfunc, xint, tol )
if nargin < 4, tol  = 1e-10; end
func = fcnchk( func );
pfunc= fcnchk( pfunc );
iter=0;
xmid = 0.5 * (xint(1) + xint(2));
fmid = feval(func, xmid);
x0    = xmid;
fx   = feval( func,  x0 );
fpx  = feval( pfunc, x0 );
done = 0; iter = 0;
xlist= [ x0 ];
while( ~done )
  [ok,x]= newtBrack(xint(1),xint(2),x0,fx,fpx);
  if(ok == 0)
      fprintf("WARNING: The next newton iterate is out of interval\n");
      fmid = feval(func, x0);
      if( fmid * feval(func, xint(1)) < 0)
        xint(2) = x0;
      else
        xint(1) = x0;
      end
      xlist = [xlist; x0];
      x0=0.5 * (xint(1) + xint(2));
      fx  = feval( func,  x0 );
      fpx = feval( pfunc, x0 );
      if (abs(xint(2)-xint(1)) < 2*tol || abs(fmid) < tol)
        done = 1;
      end
  else
      fx  = feval( func,  x );
      fpx = feval( pfunc, x );
      if( abs(x-x0) < tol )     % absolute tolerance on x
        done = 1;
      else
        xlist = [ xlist; x ];   % add to the list of x-values 
        iter  = iter + 1;
      end
      x0=x;
  end
end
fprintf('number of iterations of newton = %f\n',iter);
fprintf('xlist element = %f\n',xlist);
root = x;
fprintf('root = %f\n\n\n\n',root);
x=-2:0.01:3; y = (((1-x).*(3+x).^(1/3))./ (x.* ((4-x).^ (1/2)))-3.06);
plot(x,y);legend('function');title("Plotting the equation");xlabel("x-axis");ylabel("y-axis");grid on;
hold on; plot(root,0,'sk','LineWidth',2,'DisplayName','root'); hold off;