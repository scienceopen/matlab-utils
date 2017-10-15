function free=diskfree(mydir)
% returns disk free space in bytes
% example:  diskfree('~')
try
  free = py.shutil.disk_usage(py.os.path.expanduser(mydir)).free;
catch
  mydir = ["'",mydir,"'"];
  cmd = ['python -c "import os,shutil; print(shutil.disk_usage(os.path.expanduser(',mydir,')).free)"'];
  [err, free] = system(cmd);
end

free = str2double(free);

end %function