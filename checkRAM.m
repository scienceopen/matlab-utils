%!assert(islogical(checkRAM(1)))
function [OK,newSizeBytes,freebytes] = checkRAM(newSize, myclass)
%% checks that your requested memory for the new array won't exceed AVAILABLE RAM
% with Matlab or Octave
%
% Matlab R2015a+ attempt to do this automatically, however this function lets you check
% before simply erroring (before R2015a, you could use tons of swap memory and terribly
% slow down your computer with large arrays unintentionally).
%
% This script is optimistic as Matlab won't always be able to
% create an array using ALL available RAM, but at least you know when you
% certainly CAN'T create an array without digging deep into swap or worse.


%%
if nargin<2 || isempty(myclass)
  myclass = 'double';
end
validateattributes(myclass, {'char'}, {'vector'}, mfilename, "input variable class as character", 2)

%% get available RAM
freebytes = memfree();
%% variable sizing
switch(myclass)
  case {'single','int32','uint32'}
    bits = 32;
  case {'double','int64','uint64','float'}
    bits = 64;
  case {'int16','uint16'}
    bits = 16;
  case {'int8','uint8'}
    bits = 8;
  case {'logical','bool'}
    bits = 1;
  case {'string','char'}
    bits = 8; % FIXME is this correct?
  otherwise, error(['unhandled variable class: ', myclass])
end

newSizeBytes = prod(newSize)*bits / 8;

if newSizeBytes < freebytes
    OK = true;
else 
    OK = false;
end

disp(['New array RAM use: ',num2str(newSizeBytes/1e6,'%0.3f'),' Mbytes.'])

end
