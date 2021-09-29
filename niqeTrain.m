function r = niqeTrain(path,outPath)
  blocksizerow = 96;
  blocksizecol = 96;
  blockrowoverlap = 0;
  blockcoloverlap = 0;
  sh_th = .75;
  [mu_prisparam cov_prisparam]  = estimatemodelparam(path,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap,sh_th);
  save(outPath, 'mu_prisparam', 'cov_prisparam');
  