%% makedir
d = tempname;
matoct.fileio.makedir(d)
assert(isfolder(d))
%% copyfile
f1 = tempname;
fclose(fopen(f1,'w'));
matoct.fileio.copy_file(f1, tempdir)
%% checkRAM
assert(islogical(matoct.sys.checkRAM(1)))
%% diskfree
assert(matoct.sys.diskfree('~')>0)
%% expanduser
assert(ischar(matoct.fileio.expanduser('~')))
%% md5sum
assert(ischar(matoct.fileio.md5sum([mfilename('fullpath'), '.m'])), 'md5sum')
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
h = figure('visible',false);
plot(1)
fn = [tempname, '.png'];
matoct.vis.export_graphics(h, fn)
close(h)
assert(isfile(fn))
