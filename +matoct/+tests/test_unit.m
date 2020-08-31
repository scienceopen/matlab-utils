%% is_absolute_path
% path need not exist
assert(matoct.fileio.is_absolute_path('~/foo'), 'expand and resolve')
%% absolute_path
pabs = matoct.fileio.absolute_path('2foo');
pabs2 = matoct.fileio.absolute_path('4foo');
assert(~startsWith(pabs, "2"), 'absolute_path')
assert(strncmp(pabs, pabs2, 2), 'absolute_path 2 files')
%% makedir
d = tempname;
matoct.fileio.makedir(d)
assert(isfolder(d))
%% with_suffix
assert(matoct.fileio.with_suffix("foo.h5", ".nc") == "foo.nc", 'with_suffix switch')
%% copyfile
f1 = tempname;
fclose(fopen(f1,'w'));
matoct.fileio.copy_file(f1, tempdir)
%% checkRAM
assert(islogical(matoct.sys.checkRAM(1)))
%% diskfree
assert(isnumeric(matoct.sys.diskfree('~')))
if ~matoct.sys.isoctave
  assert(matoct.sys.diskfree('~') > 0, 'diskfree')
end
%% expanduser
assert(~startsWith(matoct.fileio.expanduser('~'), "~"), "expanduser fail")
%% md5sum
assert(isstring(matoct.fileio.md5sum([mfilename('fullpath'), '.m'])), 'md5sum')
%% find fortran
assert(ischar(matoct.sys.find_fortran_compiler()))
%% cygwin
assert(islogical(matoct.sys.iscygwin))
%% octave
assert(islogical(matoct.sys.isoctave))
%% wsl
assert(islogical(matoct.sys.iswsl))
%% memory
assert(isnumeric(matoct.sys.memfree))
%% isinteractive
assert(islogical(matoct.sys.isinteractive))
%% exportgraphics
if ~matoct.sys.isoctave
h = figure('visible',false);
plot(1)
fn = [tempname, '.png'];
matoct.vis.export_graphics(h, fn)
close(h)
assert(isfile(fn))
end
