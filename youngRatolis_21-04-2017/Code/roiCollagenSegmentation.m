function [area_norm,BW]=roiCollagenSegmentation(Img,mask_ROI)

        noiseBackground=200;
        
        Img=uint8(Img);
        mask_R(:,:,1)=uint8(mask_ROI);
        mask_R(:,:,2)=uint8(mask_ROI);
        mask_R(:,:,3)=uint8(mask_ROI);
        
        Img2=Img.*mask_R;
        Img3=rgb2gray(Img2);
        Img3=adapthisteq(Img3);

        %%Auto-threshold
        level = graythresh(Img3(mask_ROI==1));
        BW = im2bw(Img3,level);
        BW= bwareaopen(BW,noiseBackground);

        %%Calculate and save collagen area
        area_ROI=length(find(mask_ROI==1));
        area_col=length(find(BW==1));
        area_norm=area_col/area_ROI;
        
end
