function copyfile(in, out)
%% copyfile(path) overloads copyfile with tilde expansion
% "out" may be a directory or directory/name.ext
arguments
  in (1,1) string
  out (1,1) string
end

in = matpath.fileio.expanduser(in);
out = matpath.fileio.expanduser(out);

try
  copyfile(in, out);
catch e
  if e.identifier ~= "MATLAB:COPYFILE:SourceAndDestinationSame"
    rethrow(e)
  end
end

end % function
