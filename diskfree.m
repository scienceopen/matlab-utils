function freebytes = diskfree(mydir)
%% returns disk free space in bytes
% example:  diskfree('~')
% for the Matlab-Python connection, must have first done one-time Python setup:
%   https://github.com/scivision/matlab2python

validateattributes(mydir, {'char'}, {'scalartext'}, mfilename, 'drive letter to get free space from', 1)

freebytes = int64(py.shutil.disk_usage(py.pathlib.Path(mydir).expanduser().resolve()).free);

end