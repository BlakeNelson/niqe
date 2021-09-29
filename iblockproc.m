function r = iblockproc(p0, p1, p2, p3)
  if(isoctave)
    r = blockproc(p0, p1, p2, p3);
  else
    r = blkproc(p0, p1, p2, p3);
  end

