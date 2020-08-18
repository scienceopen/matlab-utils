%!assert(memfree() > 0)
%!assert(isnumeric(memfree))
function freebytes = memfree()
%% find free physical RAM on Windows (with or without Cygwin) and Linux systems
% currently Matlab doesn't support memory() on Linux/Mac systems
%
% Output:
% --------
% free physical RAM [bytes]
%
% If Python psutils not available, returns -1
%
% Michael Hirsch, Ph.D.

try
  freebytes = double(py.psutil.virtual_memory().available);
catch
  freebytes = -1;
end

end %function
