
%% checkRAM
assert(checkRAM(1))

%% diskfree
assert(diskfree('~')>0)

%% expanduser
assert(ischar(expanduser('~')))

%% find fortran
assert(ischar(find_fortran_compiler()))

%% cygwin
assert(islogical(iscygwin))

%% octave
assert(islogical(isoctave))

%% wsl
assert(islogical(iswsl))

%% memory
assert(memfree>0)

%% validate for Octave < 4.0 (silent pass)
validateattr(1,{'numeric'},{'scalar','positive'})