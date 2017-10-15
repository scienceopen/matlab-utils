%% find free physical RAM on Windows (with or without Cygwin) and Linux systems
% currently Matlab doesn't support memory() on Linux/Mac systems
% This function is meant to give free memory using Matlab or Octave
%
% It demonstrates using Python from Matlab/Octave seamlessly.
%
% Output:
% --------
% returns estimate of free physical RAM in bytes
%
% Michael Hirsch, Ph.D.

function freebytes = memfree()

try
    freebytes = double(py.psutil.virtual_memory().available);
catch
    [err,freebytes]=system('python -c "import psutil; print(psutil.virtual_memory().available)"');
    freebytes=str2double(freebytes);
end

end %function
