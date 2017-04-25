%Eleccion_ROI
function [f,roiCentroids, mask_ROIS, area_rois]=roiElection(Img,f)


     
%%Chose number of rois using API

flat=0;
    while flat~=1
        
        roiCentroids=[];
        mask_ROIS=[];
        area_rois=[];
        
        nRoi = input('How many ROIs would you like to get? : ');

        for i=1:nRoi
            %limit=100;
            limit=0;
            diameter=1400;


            %%Defining circle
            h = imellipse(gca, [limit limit diameter diameter]); 
            api = iptgetapi(h);

            fcn = getPositionConstraintFcn(h);

            api.setPositionConstraintFcn(fcn);
            pause

            BW = createMask(h);       

            area_ROI=regionprops(BW,'Area');
            area_ROI=cat(1,area_ROI.Area);
            area_rois(i)=area_ROI;

            mask_ROIS{i,1}=BW;

            centroid=regionprops(BW,'Centroid');
            roiCentroid=cat(1,centroid.Centroid);
            roiCentroids{i,1}=roiCentroid;

        end 
        
        flat = input('If ROIs are correct click ---> 1 , else click any different number ');
        pause;
        
        if flat ~=1
            close all
            f=figure;imshow(Img)
                   
        end
    end
end