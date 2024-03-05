% 
% clear;
% s = RandStream("dsfmt19937");
% n = 29767;
% orig = 1:n;
% shuff = zeros(1,n);
% k = n;
% for i = 1:n
% rng = floor(k*rand(s,1)) + 1;
% shuff(i) = orig(rng);
% orig(rng) = [];
% k = k - 1;
% end
% 
% fileID = fopen('math_words_dict.txt','w');
% fprintf(fileID,'const answers = [\n');
% for i=1:n
% fprintf(fileID,strcat(",\n"));
% end
% fprintf(fileID,']\n');

clear;

inputFile = 'math_words.txt';  % Specify the input file path
outputFile = 'math_words_dict.txt';  % Specify the output file path

% Read the lines from the input file
fid = fopen(inputFile, 'r');
if fid == -1
    error('Error opening input file.');
end
lines = textscan(fid, '%s', 'Delimiter', '\n');
lines = lines{1};  % Extract cell array of lines
fclose(fid);

% Format the lines with single quotes and comma
formattedLines = strcat("'", lines, "',");

% Remove the comma from the last line
formattedLines{end} = formattedLines{end}(1:end-1);

% Write the formatted lines to the output file
fid = fopen(outputFile, 'w');
if fid == -1
    error('Error opening output file.');
end
fprintf(fid, '%s\n', formattedLines{:});
fclose(fid);