%%select and save circular Roi iteratively over photo's paths
cd Calling
listPath=lookForRatoliImg_calling;
cd ..
limit=600;
diameter=2200;
for photoPath=listPath
    
    img=imread(photoPath{:});
    flat1=0;
    while flat1==0
        figure;
        imshow(img);

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
            imgRoi=uint8(maskRoi2).*img;
            flat1=1;
        else
            close all;
        end
    
    end
    close all;
    fileNameSplitted=strsplit(photoPath{:}, '\');
    if isdir(['..\Data_Rois\' fileNameSplitted{6} '\' fileNameSplitted{7} '\' fileNameSplitted{8}])~=1
        mkdir(['..\Data_Rois\' fileNameSplitted{6} '\' fileNameSplitted{7} '\' fileNameSplitted{8}])
    end
    imwrite(imgRoi,['..\Data_Rois\' fileNameSplitted{6} '\' fileNameSplitted{7} '\' fileNameSplitted{8} '\' fileNameSplitted{9}]);

end