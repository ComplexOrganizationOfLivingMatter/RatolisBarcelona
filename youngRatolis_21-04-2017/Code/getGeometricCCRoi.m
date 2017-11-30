function [Mean_Area,Std_Area,Mean_major_axis,Mean_minor_axis,Mean_relation_axis,Std_relation_axis,Mean_Pix_convex_region,Std_Pix_convex_region,numOfCells] = getGeometricCCRoi( roiPath )
    %This function get and save the properties got for each roi
    artifact=500;
    imgRoi=imread(roiPath);
    imgRoi=im2bw(imgRoi);
    %figure,imshow(imgRoi);
    imgRoi=bwlabel(bwareaopen(1-imgRoi,artifact));
    imgRoi(imgRoi==1)=0;
    imgRoi=im2bw(bwlabel(imgRoi));
    %figure,imshow(imgRoi);
    
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

 
    path2save=strrep(roiPath, 'mask_', '');
    
    figure('Visible','off'),imshow(imgRoi)
    centroids=regionprops(imgRoi,'Centroid');
    for k=1:size(centroids,1)
        c=centroids(k).Centroid;
        text(c(1),c(2),sprintf('%d',k),'HorizontalAlignment','center','VerticalAlignment','middle','Color',[0 0 1],'FontSize',5);
    end
    print('-f1', '-r300','-dbmp',strrep(path2save, 'edited', 'segmentedCells'))
    close all

    path2save=strrep(path2save, '.jpg', '.mat');
    path2save=strrep(path2save, '_edited', '_ccs');
    
    numOfCells=size(major_axis,1);
    save(path2save, 'Mean_Area','Std_Area','Mean_major_axis','Mean_minor_axis','Mean_relation_axis','Std_relation_axis','Mean_Pix_convex_region','Std_Pix_convex_region')

end

