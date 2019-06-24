function freebytes = memfree()
%% find free physical RAM on Windows (with or without Cygwin) and Linux systems
% Matlab at least through R2019a doesn't support memory() on Linux / Mac systems
% This function gives free memory on Windows, MacOS and Linux using Python psutil.
%
% Output:
% --------
% free physical RAM [bytes]

freebytes = int64(py.psutil.virtual_memory().available);

end %function
