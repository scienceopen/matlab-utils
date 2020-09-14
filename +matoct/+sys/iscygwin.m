%!assert(islogical(iscygwin))
function iscyg = iscygwin()

if isempty(cyg)
  if ispc || ismac
    cyg=false;
  elseif isunix
    fid = fopen('/proc/version');
    v = fscanf(fid,'%s');
    fclose(fid);
    iscyg = contains(v, 'CYGWIN');
  end
end

end
