%% is_absolute_path
% path need not exist
assert(matpath.fileio.is_absolute_path('~/foo'), 'expand and resolve')
%% absolute_path
pabs = matpath.fileio.absolute_path('2foo');
pabs2 = matpath.fileio.absolute_path('4foo');
assert(~startsWith(pabs, "2"), 'absolute_path')
assert(strncmp(pabs, pabs2, 2), 'absolute_path 2 files')
%% makedir
d = tempname;
matpath.fileio.makedir(d)
assert(isfolder(d))
%% with_suffix
assert(matpath.fileio.with_suffix("foo.h5", ".nc") == "foo.nc", 'with_suffix switch')
%% copyfile
f1 = tempname;
fclose(fopen(f1,'w'));
matpath.fileio.copyfile(f1, tempdir)
%% checkRAM
assert(islogical(matpath.sys.checkRAM(1)))
%% diskfree
assert(isnumeric(matpath.sys.diskfree('~')))
if ~matpath.sys.isoctave
  assert(matpath.sys.diskfree('~') > 0, 'diskfree')
end
%% expanduser
assert(~startsWith(matpath.fileio.expanduser('~'), "~"), "expanduser fail")
%% md5sum
assert(isstring(matpath.fileio.md5sum([mfilename('fullpath'), '.m'])), 'md5sum')
%% find fortran
assert(isstring(matpath.sys.find_fortran_compiler()))
%% cygwin
assert(islogical(matpath.sys.iscygwin))
%% octave
assert(islogical(matpath.sys.isoctave))
%% wsl
assert(islogical(matpath.sys.iswsl))
%% memory
assert(isnumeric(matpath.sys.memfree))
%% isinteractive
assert(islogical(matpath.sys.isinteractive))
