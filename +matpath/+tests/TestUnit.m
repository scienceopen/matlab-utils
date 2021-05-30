classdef TestUnit < matlab.unittest.TestCase

methods (Test)

function test_expanduser(tc)
tc.verifyFalse(startsWith(matpath.fileio.expanduser('~/foo'), "~"))
tc.verifyFalse(any(startsWith(matpath.fileio.expanduser(["~/abc", "~/123"]), "~")))

tc.verifyTrue(endsWith(matpath.fileio.expanduser('~/foo'), "foo"))
tc.verifyTrue(all(endsWith(matpath.fileio.expanduser(["~/abc", "~/123"]), ["abc", "123"])))

tc.verifyEmpty(matpath.fileio.expanduser(string.empty))
tc.verifyEqual(matpath.fileio.expanduser(""), "")
end

function test_posix(tc)
if ispc
  tc.verifyFalse(contains(matpath.posix("c:\foo"), "\"))
  tc.verifyFalse(any(contains(matpath.posix(["x:\123", "d:\abc"]), "\")))
end

tc.verifyEmpty(matpath.posix(string.empty))
end

function test_is_absolute_path(tc)
% path need not exist
tc.verifyTrue(matpath.fileio.is_absolute_path('~/foo'))
if ispc
  tc.verifyTrue(matpath.fileio.is_absolute_path('x:/foo'))
  tc.verifyEqual(matpath.fileio.is_absolute_path(["x:/abc", "x:/123", "", "c"]), [true, true, false, false])
  tc.verifyTrue(all(matpath.fileio.is_absolute_path(["x:/abc"; "x:/123"])))
  tc.verifyFalse(matpath.fileio.is_absolute_path('/foo'))
else
  tc.verifyTrue(matpath.fileio.is_absolute_path('/foo'))
end

tc.verifyEmpty(matpath.fileio.is_absolute_path(string.empty))
tc.verifyFalse(matpath.fileio.is_absolute_path(""))
tc.verifyFalse(matpath.fileio.is_absolute_path("c"))
end

function test_absolute_path(tc)

pabs = matpath.fileio.absolute_path('2foo');
pabs2 = matpath.fileio.absolute_path('4foo');
tc.verifyFalse(startsWith(pabs, "2"))
tc.verifyTrue(strncmp(pabs, pabs2, 2))

par1 = matpath.fileio.absolute_path("../2foo");
par2 = matpath.fileio.absolute_path("../4foo");
tc.verifyFalse(startsWith(par1, ".."))
tc.verifyTrue(strncmp(par2, pabs2, 2))

pt1 = matpath.fileio.absolute_path("bar/../2foo");
tc.verifyFalse(contains(pt1, ".."))

va = matpath.fileio.absolute_path(["2foo", "4foo"]);
tc.verifyFalse(any(startsWith(va, "2")))
vs = extractBefore(va, 2);
tc.verifyEqual(vs(1), vs(2))

tc.verifyEmpty(matpath.fileio.absolute_path(string.empty))
tc.verifyEqual(matpath.fileio.absolute_path(""), string(pwd))
end

function test_makedir(tc)
d = tempname;
matpath.fileio.makedir(d)
tc.assertTrue(isfolder(d))
end

function test_which(tc)

tc.verifyEmpty(matpath.fileio.which(string.empty))

n = "matlab";
% assumes Matlab in environment variable PATH
tc.assumeNotEmpty(matpath.fileio.which(n))

p = fullfile(matlabroot, "bin", n);

% full absolute path
exe = matpath.fileio.which(p);

if ispc
  tc.verifyTrue(endsWith(exe, ".exe"))
else
  tc.verifyFalse(endsWith(exe, ".exe"))
end
tc.assertTrue(isfile(exe))

end

function test_with_suffix(tc)
tc.verifyEqual(matpath.fileio.with_suffix("foo.h5", ".nc"), "foo.nc")
if ~verLessThan("matlab", "9.9")
% fileparts vectorized in R2020b
tc.verifyEqual(matpath.fileio.with_suffix(["foo.h5", "bar.dat"], ".nc"), ["foo.nc", "bar.nc"])

tc.verifyEmpty(matpath.fileio.with_suffix(string.empty, ".nc"))
tc.verifyEqual(matpath.fileio.with_suffix("", ""), "")
tc.verifyEqual(matpath.fileio.with_suffix("c", ""), "c")
tc.verifyEqual(matpath.fileio.with_suffix("c.nc", ""), "c")
tc.verifyEqual(matpath.fileio.with_suffix("", ".nc"), ".nc")
end
end

function test_copyfile(tc)
f1 = tempname;
fclose(fopen(f1,'w'));
matpath.fileio.copyfile(f1, tempdir)
end

function test_find_fortran(tc)
tc.assertTrue(isstring(matpath.sys.find_fortran_compiler()))
end

function test_cygwin(tc)
tc.assertTrue(islogical(matpath.sys.iscygwin))
end

function test_octave(tc)
tc.assertTrue(islogical(matpath.sys.isoctave))
end

function test_wsl(tc)
tc.assertTrue(islogical(matpath.sys.iswsl))
end

function test_isinteractive(tc)
tc.assertTrue(islogical(matpath.sys.isinteractive))
end

end

end
