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
    meth='py.psutil';
catch
    [err,freebytes]=system('python -c "import psutil; print(psutil.virtual_memory().available)"');
    if ~err
        freebytes=str2double(freebytes);
        meth='python psutil';
    else
        error('Python psutil not found.')
    end
end

%%
disp([num2str(freebytes/1e9,'%0.2f'),' Gbyte available RAM via ',meth])

if ~nargout,clear,end
end %function
