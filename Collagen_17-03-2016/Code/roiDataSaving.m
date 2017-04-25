%the aims is split collagen form backgroind

function roiDataSaving(ratoli,muscle,photo)

    cd ..
    cd Photos
    cd (ratoli)
    cd (muscle)

    %read images and save dimensions

    Img=imread(photo,'jpg');

    [H,W,c]=size(Img);

    %chose rois

    f=figure;imshow(Img)

    cd ..\..\..
    cd ('Code')

    [f,centroides_ROI, mask_ROIS, area_rois]=roiElection(Img,f);

    cd ..
    cd Photos
    cd (ratoli)
    cd (muscle)

    %save photo + roi election
    
    save([photo 'data_ROIS\' photo '_data_ROIs'], 'centroides_ROI', 'mask_ROIS','area_rois')
    saveas(f,[photo 'data_ROIS\' photo '_ROIs.jpg'])

   
    cd ..\..\..
    cd ('Code')

    close all    
end