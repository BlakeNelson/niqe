function r = niqeDir(path, filetype)
  files = ls(strcat(path,filetype))

  blocksizerow = 96;
  blocksizecol = 96;
  blockrowoverlap = 0;
  blockcoloverlap = 0;
  load modelparameters.mat cov_prisparam mu_prisparam;

  [fileCount ~] = size(files);

  for i = 1:fileCount
    I = iload(files(i, :));
  end

