%%select and save circular Roi iteratively over photo's paths
function choseAndSaveRoiFibresAndNuclei(imageColPath,imageNucPath,group)
    
    limit=600;
    diameter=2200;
    
    imgCol=imread(imageColPath);
    imgNuc=imread(imageNucPath);
    flat1=0;
    while flat1==0
        figure;
        imshow(imgCol);

        %%Defining ROI dimension
        hroi = imellipse(gca, [limit limit diameter diameter]); 
        api = iptgetapi(hroi);

        fcn = getPositionConstraintFcn(hroi);

        api.setPositionConstraintFcn(fcn);
        pause

        maskRoi = createMask(hroi); 

        flat2 = input('Is ROI correct?(Yes-1/No- Otherwise): ');
        pause;

        if flat2==1
            close all
            maskRoi2=[];
            maskRoi2(:,:,1)=maskRoi;
            maskRoi2(:,:,2)=maskRoi;
            maskRoi2(:,:,3)=maskRoi;
            imgColRoi=uint8(maskRoi2).*imgCol;
            imgNucRoi=uint8(maskRoi2).*imgNuc;
            flat1=1;
        else
            close all;
        end
    
    end
    close all;
    fileNameColSplitted=strsplit(imageColPath, '\');
    fileNameNucSplitted=strsplit(imageNucPath, '\');
    if isdir(['..\..\Data_Rois\' group '\' fileNameColSplitted{5} '\' fileNameColSplitted{6}(end-5:end-4)])~=1
        mkdir(['..\..\Data_Rois\' group '\' fileNameColSplitted{5} '\' fileNameColSplitted{6}(end-5:end-4)])
    end
    imwrite(imgColRoi,['..\..\Data_Rois\' group '\' fileNameColSplitted{5} '\' fileNameColSplitted{6}(end-5:end-4) '\' fileNameColSplitted{6}]);
    imwrite(imgNucRoi,['..\..\Data_Rois\' group '\' fileNameColSplitted{5} '\' fileNameColSplitted{6}(end-5:end-4) '\' fileNameNucSplitted{6}]);
end