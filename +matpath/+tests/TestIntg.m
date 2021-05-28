classdef TestIntg < matlab.unittest.TestCase

methods (Test)

function test_checkRAM(tc)
tc.assumeNotEmpty(pyversion)

tc.assertTrue(islogical(matpath.sys.checkRAM(1)))
end

function test_diskfree(tc)
tc.assertTrue(isnumeric(matpath.sys.diskfree('~')))
tc.assertTrue(matpath.sys.diskfree('~') > 0, 'diskfree')
end

function test_memory(tc)
tc.assumeNotEmpty(pyversion)
tc.assertTrue(isnumeric(matpath.sys.memfree))
end

end
end
