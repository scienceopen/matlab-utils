function freebytes = diskfree(direc)
%% returns disk free space in bytes
% example:  diskfree('~')
arguments
  direc (1,1) string
end

direc = matpath.fileio.expanduser(direc);

assert(isfolder(direc), '%s is not a folder', direc)

freebytes = java.io.File(direc).getUsableSpace;

end
