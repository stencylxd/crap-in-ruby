# array-tools || stencylxd 2020

public;def mvo(x);l=self.length-1;if x>l # Method move one.
raise"mvo: given pram is more than array length.";abort
elsif l<0;raise"mvo: given array has no objects.";abort
elsif x<0;raise"mvo: please specify a number higher than -1."
abort;elsif (x+1)>l;raise "mvo: please specify different number";abort
end;b = self[(x+1)];xb=self[x];self[(x+1)]=xb;self[x]=b;return self;end

