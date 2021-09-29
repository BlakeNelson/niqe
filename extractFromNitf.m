function extractFromNitf(path, targetSegIdx)
  files = ls(strcat(path,'/','*.ntf'))

  [fileCount, ~] = size(files);

  for fileIdx = 1:fileCount
    filePath = strcat(path,'/',files(fileIdx,:))
    fileInfo = nitfinfo(filePath);
    segmentCount = fileInfo.NumberOfImages;
    for segIdx = 1:segmentCount
      if targetSegIdx > 0 && segIdx ~= targetSegIdx 
        continue
      end
      
      I = nitfread(filePath, 1);
      outPath = replace(filePath, '.ntf', strcat('_',string(segIdx),'.jp2'));
      imwrite(I, outPath);
    end
  end
    
