
# mvo_array_space || stencylxd 2020
# This is a function that moves a object one space in a array.

public;def mvo(x);case x;when 1;raise"mvo: given pram is more than array length." # Method for fallback errors.
abort;when 2;raise"mvo: given array has no objects.";abort;when 3
raise"mvo: please specify a number higher than -1.";abort;end;end
def mvup(x);l=self.length-1;if x>l;mvo(1) # Method move up.
elsif l<0;mvo(2);elsif x<0;mvo(3);elsif (x+1)>l;x=-1
end;b = self[(x+1)];xb=self[x];self[(x+1)]=xb;self[x]=b;return self;end
def mvdn(x);l=self.length-1;if x>l;mvo(1) # Method move down.
elsif l<0;mvo(2);elsif x<0;mvo(3);elsif (x-1)>l;mvo(4)
end;b = self[(x-1)];xb=self[x];self[(x-1)]=xb;self[x]=b;return self;end

# X is the array index of the object. (see above methods)
