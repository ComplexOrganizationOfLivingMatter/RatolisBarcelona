%the aims is split collagen form backgroind

function roiCollagenDataSaving(ratoli,muscle,photo)

    cd ..
    cd Photos
    cd (ratoli)
    cd (muscle)

    %read images and save dimensions

    Img=imread(photo,'jpg');


    %chose rois

    f=figure;imshow(Img)

    cd ..\..\..
    cd ('Code')

    [f,centroides_ROI, mask_ROIS, area_rois]=roiCollagenElection(Img,f);

    cd ..
    cd Photos
    cd (ratoli)
    cd (muscle)

    %save photo + roi election
    mkdir([photo '_data_ROIS\'])
    save([photo '_data_ROIS\' photo '_data_ROIs'], 'centroides_ROI', 'mask_ROIS','area_rois')
    saveas(f,[photo '_data_ROIS\' photo '_ROIs.jpg'])

   
    cd ..\..\..
    cd 'Code'

    close all    
end