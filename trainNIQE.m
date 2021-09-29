function r = trainNIQE(path,outPath,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap,sharpnessThreshold)
  blocksizerow = 96;
  blocksizecol = 96;
  blockrowoverlap = 0;
  blockcoloverlap = 0;
  sharpnessThreshold = .75;
  [mu_prisparam cov_prisparam]  = estimatemodelparam(path,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap,sharpnessThreshold);
  save(outPath, 'mu_prisparam', 'cov_prisparam', 'blocksizerow', 'blocksizecol', 'blockrowoverlap', 'blockcoloverlap');
  
