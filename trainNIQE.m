function r = trainNIQE(path,outPath,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap,sharpnessThreshold)
  [mu_prisparam cov_prisparam]  = estimatemodelparam(path,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap,sharpnessThreshold);
  save(outPath, 'mu_prisparam', 'cov_prisparam', 'blocksizerow', 'blocksizecol', 'blockrowoverlap', 'blockcoloverlap');
  
