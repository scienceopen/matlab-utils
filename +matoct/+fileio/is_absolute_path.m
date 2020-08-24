function isabs = is_absolute_path(path)
%% true if path is absolute. Path need not yet exist.

narginchk(1,1)

path = matoct.fileio.expanduser(path);
% Must expanduser() before Java

if matoct.sys.isoctave
  isabs = is_absolute_filename(path);
elseif usejava('jvm')
  isabs = java.io.File(path).isAbsolute();
elseif ispc
  isabs = isletter(path(1)) && strcmp(path(2), ':') && any(strcmp(path(3), ['/', '\']));
else
  isabs = strcmp(path(1), '/');
end

end % function
