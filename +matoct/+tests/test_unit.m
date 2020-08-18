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
