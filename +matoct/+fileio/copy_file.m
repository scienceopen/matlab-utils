function copy_file(in, out)
%% copy_file(path) overloads copyfile with tilde expansion
% distinction: copy_file "out" must be directory.
narginchk(2,2)

fin = matoct.fileio.absolute_path(in);
fout = matoct.fileio.absolute_path(out);

if ~isfolder(fout)
  error('copyfile:file_not_found', '%s is not a directory', fout)
end

if strcmp(fin, fout) || strcmp(fileparts(fin), fout)
  fprintf(2, 'SKIP: copy of file onto itself: %s\n', fin);
  return
end

copyfile(fin, fout);

end
