%!error validate_attributes([1,1],{'numeric'},{'scalar','positive'})
%!test validate_attributes(1,{'numeric'},{'scalar','positive'})

function validate_attributes(varargin)
% overloading doesn't work in Octave since it is a core *library* function
% there doesn't appear to be a solution besides renaming this function.

if exist('validateattributes') == 0
  return
end

validateattributes(varargin{:})

end
