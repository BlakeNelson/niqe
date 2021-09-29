function r = niqeDir(path, colBorder, rowBorder)
  files = ls(strcat(path,'/','*.jp2'))

  blocksizerow = 96;
  blocksizecol = 96;
  blockrowoverlap = 0;
  blockcoloverlap = 0;
  %load modelparameters.mat cov_prisparam mu_prisparam;
  load 'E:\Users\bnelson1\IQT\data\ir_spot_jp2\model1.mat' cov_prisparam mu_prisparam;
  [fileCount, ~] = size(files);

  scores = [];
  inputs = strings(1,1);
  outIdx = 1;
  for fileIdx = 1:fileCount
    filePath = strcat(path,'/',files(fileIdx,:))
      
      I = imread(filePath);
      [irows, icols] = size(I);
      if( irows > 2* rowBorder )
        I = I(rowBorder:irows-rowBorder, :);
      end
      if( icols > 2*colBorder )
        I = I(:, colBorder:icols-colBorder);
      end
              
      qualityScore = computequality(I,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap,mu_prisparam,cov_prisparam);
      inputs(outIdx,1) = filePath();
      scores(outIdx,1) = qualityScore;
      outIdx = outIdx+1;
  end
  
  t = table(inputs, scores);
  writetable(t, strcat(path, '/scores.csv'));

