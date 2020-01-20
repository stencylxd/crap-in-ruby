
# array-tools || stencylxd 2020

public;def mvup(x);l=self.length-1;if x>l # Method mvup.
raise"mvup: given pram is more than array length.";abort
elsif l<0;raise"mvup: given array has no objects.";abort
elsif x<0;raise"mvup: please specify a number higher than -1."
abort;elsif (x+1)>l;raise "mvup: please specify lower number";abort
end;b = self[(x+1)];xb=self[x];self[(x+1)]=xb;self[x]=b;return self;end
