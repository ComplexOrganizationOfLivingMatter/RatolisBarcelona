%This calling have the purpose of let you chose rois for each image of
%ratoli

addpath('..\lib')
cd '..\..\Photos'
[stat,struc] = fileattrib;
PathCurrent = struc.Name;
%[listImages]=getAllFiles('..\..\Photos');


%ratolis path


ratolis = dir(PathCurrent);
ratolis(1:2)=[];


for i=1:length(ratolis)
    
    ratoli=ratolis(i).name;
    cd (ratoli)
    
    %muscle path
    [stat,struc] = fileattrib;
    PathCurrent = struc.Name;
    
    muscleRatolis = dir(PathCurrent);
    muscleRatolis(1:2)=[];
    
    for j=1:length(muscleRatolis)
                
        muscle=muscleRatolis(j).name;
        cd (muscle)
        
        %photos path
        [stat,struc] = fileattrib;
        PathCurrent = struc.Name;

        photosRatoli = dir([PathCurrent '\col*.jpg']);
        %photosRatoli(1:2)=[];        
               
        
        for k=1:length(photosRatoli)
            
            photo=photosRatoli(k).name;
            photo=photo(1:end-4);
     
            if strcmp(photo(end-2:end),'OIs')~=1
            
                cd ..\..\..
                cd 'Code'

                roiCollagenDataSaving(ratoli,muscle,photo);

                cd ..
                cd Photos
                cd (ratoli)
                cd (muscle)
            end
        end    
        
        cd ..
    end
    
    cd ..
    
 
end

cd ..
cd ('Code\Callings')




