function [Mean_Area,Std_Area,Mean_major_axis,Mean_minor_axis,Mean_relation_axis,Std_relation_axis,Mean_Pix_convex_region,Std_Pix_convex_region] = getGeometricCCRoi( roiPath )
%This function get and save the properties got for each roi
imgRoi=imread(roiPath);
imgRoi=im2bw(imgRoi);
imgRoi=bwareaopen(imgRoi,10);

% CC1 and CC2
    s=regionprops(imgRoi,'Area');
    cell_area=cat(1,s.Area);
    Mean_Area=mean(cell_area);
    Std_Area=std(cell_area);

% CC3 - CC6
    %elongation (major and minor axis cells) abd relation between them
    major_axis = regionprops(imgRoi,'MajorAxisLength');
    major_axis = cat(1, major_axis.MajorAxisLength);
    Mean_major_axis = mean(major_axis);

    minor_axis = regionprops(imgRoi,'MinorAxisLength');
    minor_axis = cat(1, minor_axis.MinorAxisLength);
    Mean_minor_axis = mean(minor_axis);

    Relation_axis=major_axis./minor_axis;
    Mean_relation_axis=mean(Relation_axis);
    Std_relation_axis=std(Relation_axis);

% CC7 & CC8
    %convex hull
    Pix_convex_region=regionprops(imgRoi,'Solidity');
    Pix_convex_region=cat(1, Pix_convex_region.Solidity);
    Mean_Pix_convex_region=mean(Pix_convex_region);
    Std_Pix_convex_region=std(Pix_convex_region);

splittedPath=strsplit(roiPath,'\');
name=strsplit(splittedPath{end},'_');
name=name{2};
 
save(['D:\Pedro\Ratolis Barcelona\Fibers_size_20-01-2017\Data_Rois\' splittedPath{6} '\' splittedPath{7} '\' splittedPath{8} '\' name '.mat'], 'Mean_Area','Std_Area','Mean_major_axis','Mean_minor_axis','Mean_relation_axis','Std_relation_axis','Mean_Pix_convex_region','Std_Pix_convex_region')
  
end

