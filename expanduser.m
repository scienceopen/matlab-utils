%!assert(ischar(expanduser('~')))
function expanded = expanduser(p)
% expanded = expanduser(path)
%
%   expands tilde ~ into user home directory for Matlab and GNU Octave.
%
%   Useful for Matlab functions like h5read() and some Computer Vision toolbox functions
%   that can't handle ~ and Matlab does not consider it a bug per conversations with
%   Mathworks staff
%
%   See also absolute_path

narginchk(1,1)

validateattributes(p, {'char'}, {'vector'})
%% GNU Octave
if isoctave
  expanded = tilde_expand(p);
  return
end

%% Matlab
expanded = p;

if strcmp(expanded(1), '~')
  expanded = fullfile(char(java.lang.System.getProperty("user.home")), expanded(2:end));
end

end %function
