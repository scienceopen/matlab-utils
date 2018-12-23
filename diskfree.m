%!assert(diskfree('~')>0)

function freebytes = diskfree(mydir)
%% returns disk free space in bytes
% example:  diskfree('~')

validateattributes(mydir, {'char'}, {'vector'},mfilename,'drive letter to get free space from',1)

try
  freebytes = double(py.shutil.disk_usage(py.os.path.expanduser(mydir)).free);
catch
  mydir = ["'",mydir,"'"];
  cmd = ['python -c "import os,shutil; print(shutil.disk_usage(os.path.expanduser(',mydir,')).free)"'];
  [err, free] = system(cmd);
  freebytes = str2double(free);
end

end %function
