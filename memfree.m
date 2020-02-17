function freebytes = memfree()
%% find free physical RAM on Windows (with or without Cygwin) and Linux systems
% Matlab doesn't support memory() on Linux / Mac systems
% This function gives free memory on Windows, MacOS and Linux using Python psutil.
%
% Output:
% --------
% free physical RAM [bytes]
%
% Returns -1 if memory is not determinable.

freebytes = -1;

if isoctave
  [status, msg] = system('python3 -c "import psutil; print(psutil.virtual_memory().available)"');
  if status == 0
    freebytes = int64(msg);
  endif
else
  try
    freebytes = int64(py.psutil.virtual_memory().available);
  end
endif


end %function
