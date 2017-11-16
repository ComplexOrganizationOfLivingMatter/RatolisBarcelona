function dapiSegmentationAndNucleiCounting(imageNucPath,group)
    

    %% loading images
    fileNameNucSplitted=strsplit(imageNucPath, '\');
    nucliRoi=['..\..\Data_Rois\' group '\' fileNameNucSplitted{5} '\' fileNameNucSplitted{6}(end-5:end-4) '\' fileNameNucSplitted{6}];
    

    % Load dapi's channel
    Img=imread(nucliRoi);
    
    B=im2double(Img(:,:,3));    
    [H,W,~]=size(Img);
    
    %% Getting objects and deleting noise
    %Enhancer
    B=imadjust(B);
    %Logical image
    BW = im2bw(B);
    %Deleting objects smaller than 400 pix
    BWmin= bwareaopen(BW,400);
    %%figure,imshow(BWmin)

    %% Reduce size from highest dapi regions connected
    %Initialize var
    BWmax=zeros(H,W);

    %calculate area of objects
    Area_ob = regionprops(BWmin, 'area');
    Area_ob = cat(1, Area_ob.Area);
    area_mean=mean(Area_ob);
    L=bwlabel(BWmin,8);

    for i=1:max(max(L))

        BWmax(L==i)=i;
        objt=BWmax(L==i);
        %calculate treshold intensity to delete area from big objects
        rest=max(B(L==i))-min(B(L==i));
        if Area_ob(i)>(area_mean*1.2)
                int_tresh=min(B(L==i))+rest*0.85;       
        else
            int_tresh=min(B(L==i))+rest*0.40;
        end
        
        objt(B(L==i)<int_tresh)=0;
        BWmax(L==i)=objt;
        BWmax(BWmax>0)=1;

    end

    %Clear small objects 
    BWmax= bwareaopen(BWmax,80);
    %fill holes
    BWmax=imfill(BWmax,'holes');

    %Write segmented dapi images
    centroids=regionprops(BWmax,'Centroid');
    figure,imshow(BWmax)
    
    for k=1:size(centroids,1)
        c=centroids(k).Centroid;
        text(c(1),c(2),sprintf('%d',k),'HorizontalAlignment','center','VerticalAlignment','middle','Color',[0 0 1],'FontSize',5);
    end
    
    print('-f1', '-r300','-dbmp',[nucliRoi(1:end-4) '_segmentedRoi.bmp'])
    numOfNuclei=max(max(bwlabel(BWmax)));
    save([nucliRoi(1:end-4) '.mat'], 'numOfNuclei')

end

