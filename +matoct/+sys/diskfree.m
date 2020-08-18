function freebytes = diskfree(mydir)
%% returns disk free space in bytes
% example:  diskfree('~')

narginchk(1,1)
validateattributes(mydir, {'char'}, {'vector'}, mfilename, 'drive letter to get free space from', 1)

if matoct.sys.isoctave
    freebytes = -1;
    return
end

mydir = matoct.fileio.expanduser(mydir);

assert(isfolder(mydir), '%s is not a folder', mydir)

freebytes = java.io.File(mydir).getUsableSpace;

end
