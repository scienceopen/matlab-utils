% demonstrates GNU Octave and Matlab calls that return error code for CI
% but still allow IDE development without forced exit
%
% replace error('test error') with your top-level CI script
%
% for CI run like
% * Cctave:  octave-cli -q --eval errorret
% * Matlab:  matlab -nojvm -r errorret

try
  error('test error')
catch excp
  if isoctave || usejava('desktop')  % interactive
    rethrow(excp)
  else  % -nodesktop or -nojvm
    fprintf(2, excp.message)  % print to stderr
    exit(1)
  end
end
