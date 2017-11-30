
    
    addpath '..\lib'
    addpath ..
    allFiles=getAllFiles('..\..\Photos');

    indCol=cell2mat(cellfun(@(x) ~isempty(strfind(x,'\col')),allFiles,'UniformOutput',false));
    indNuc=cell2mat(cellfun(@(x) ~isempty(strfind(x,'\nuc')),allFiles,'UniformOutput',false));
    colFiles=allFiles(indCol);
    nucFiles=allFiles(indNuc);
    

    imagesToAnalyse.G1.Triceps={'tric_A3','tric_B7','tric_B4','tric_C7','tric_D12','tric_E2','tric_F1','tric_F5','tric_G7','tric_H4'};
    imagesToAnalyse.G2.Triceps={'tric_I1','tric_I8','tric_J6','tric_J3','tric_K1','tric_L5','tric_L6','tric_M5','tric_M4','tric_M1'};
    imagesToAnalyse.G3.Triceps={'tric_N1','tric_N2','tric_O2','tric_O5','tric_P4','tric_P7','tric_Q1','tric_Q4','tric_Q3','tric_R1'};    
    imagesToAnalyse.G1.Quad={'quad_A8','quad_A7','quad_B1','quad_C4','quad_D2','quad_D3','quad_E1','quad_F4','quad_G4','quad_H1'};
    imagesToAnalyse.G2.Quad={'quad_I5','quad_I4','quad_J5','quad_J1','quad_K5','quad_K4','quad_L7','quad_L6','quad_M5','quad_M1'};
    imagesToAnalyse.G3.Quad={'quad_N3','quad_N7','quad_O2','quad_O3','quad_P4','quad_P2','quad_Q6','quad_Q2','quad_R2','quad_R3'};
    imagesToAnalyse.G1.Diaf={'diaf_A1','diaf_B2','diaf_C1','diaf_C2','diaf_D6','diaf_E8','diaf_F1','diaf_G5','diaf_G6','diaf_H1'};
    imagesToAnalyse.G2.Diaf={'diaf_I3','diaf_I4','diaf_J1','diaf_J2','diaf_K5','diaf_L6','diaf_L3','diaf_L1','diaf_M6','diaf_M5'};
    %%imagesToAnalyse.G3.Diaf={'diaf_N3','diaf_N7','diaf_O1','diaf_O3','diaf_P1','diaf_P2','diaf__________','diaf__________','diaf_R4','diaf_R2'};
    imagesToAnalyse.G3.Diaf={'diaf_N3','diaf_N7','diaf_O1','diaf_O3','diaf_P1','diaf_P2','diaf_R4','diaf_R2','diaf_Q1','diaf_Q2'};
    
    filesToAnalyse=imagesToAnalyse;
    
    numGroups=3;
    numMuscles=3;
    numSamples=10;
    muscles={'Triceps','Quad','Diaf'};
    cellData=cell(90,12);
    counter=1;
    for i=1:numGroups
        for j=1:numMuscles
            for k=1:numSamples
                nameToMatch=imagesToAnalyse.(['G' num2str(i)]).(muscles{j}){k};
                imageColPath=colFiles{cell2mat(cellfun(@(x) ~isempty(strfind(lower(x),lower(nameToMatch))),colFiles,'UniformOutput',false))};
                imageNucPath=nucFiles{cell2mat(cellfun(@(x) ~isempty(strfind(lower(x),lower(nameToMatch))),nucFiles,'UniformOutput',false))};
                
                fileNameSplitted=strsplit(imageColPath, '\');
                imageRoiFibresPath=['..\..\Data_Rois\G' num2str(i) '\' fileNameSplitted{5} '\' fileNameSplitted{6}(end-5:end-4) '\' fileNameSplitted{6}];
                
                %Doing roi election and segmentation if it wasn't already done. 
                if ~exist(imageRoiFibresPath,'file')
                    %roi election
                    choseAndSaveRoiFibresAndNuclei(imageColPath,imageNucPath,['G' num2str(i)])
                    close
                    %roi segmentation using treshold 
                    roiFibresSegmentation(imageRoiFibresPath)
                    %segmentationOfDapi
                    dapiSegmentationAndNucleiCounting(imageNucPath,['G' num2str(i)])
                end
                
                %if there are any edited roi mask get geometric features
                image2ExtractFeatures=strrep(imageRoiFibresPath, '.jpg', '_edited.jpg');
                image2ExtractFeatures=strrep(image2ExtractFeatures, 'col', 'mask_col');
                if exist(image2ExtractFeatures,'file')
                    
                    nucliPath=strrep(imageRoiFibresPath, 'coll_', 'nucli_');
                    nucliPath=strrep(nucliPath, '.jpg', '.mat');
                    
                    [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8,numOfCells] = getGeometricCCRoi( image2ExtractFeatures );
                    
                    load(nucliPath,'numOfNuclei')
                    
                    cellData(counter,:)={['G' num2str(i)],nameToMatch,cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8,numOfNuclei,numOfCells};
                    counter=counter+1;
                    
                end
                
               
            end
        end
    end
    T=cell2table(cellData);
    T.Properties.VariableNames = {'Genotype','Image','Mean_area','Std_area','Mean_major_axis','Mean_minor_axis','Mean_relation_axis','Std_relation_axis','Mean_pix_convex_region','Std_pix_convex_region','number_Of_nuclei','number_of_fibres'};
    writetable(T, ['..\..\Data_Rois\featuresExtration_' date '.xls']);
