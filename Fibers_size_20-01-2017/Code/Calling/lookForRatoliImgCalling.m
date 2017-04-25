function[listPhotosRatolis]=lookForRatoliImg_calling

    typeRatolis=[{'WT'},{'Non-treated mdx'},{'Treated mdx'}];
    nameRatolisWT=[{'a'},{'b'},{'e'},{'h'},{'j'}];
    nameRatolisNonTreated=[{'c'},{'d'},{'g'},{'i'},{'k'}];
    nameRatolisTreated=[{'f'},{'l'},{'m'},{'n'},{'o'},{'p'},{'q'}];

    listPhotosRatolis={};
    i=1;
cd ..
    %%Ratolis WT
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{1},179); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{1},182); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{1},12); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{1},13); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{2},260); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{2},257); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{2},261); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{2},256); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{2},277); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{2},281); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{2},228); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{2},229); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{3},193); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{3},198); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{3},196); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{3},189); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{3},151); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{3},148); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{3},150); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{4},271); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{4},267); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{4},268); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{4},286); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{4},282); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{4},273); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{5},88); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{5},87); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{5},85); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{5},39); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{1},nameRatolisWT{5},42); i=i+1;

    %%Ratolis Non-treated
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{1},27); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{1},26); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{1},1); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{1},3); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{1},186); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{1},188); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{2},171); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{2},172); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{2},166); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{2},167); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{2},152); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{2},156); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{3},73); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{3},76); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{3},90); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{3},91); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{3},80); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{3},81); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{4},263); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{4},262); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{4},242); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{4},239); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{4},9); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{4},10); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{5},54); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{5},55); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{5},32); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{5},37); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{5},43); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{2},nameRatolisNonTreated{5},48); i=i+1;

    %%Ratolis Non-treated
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{1},51); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{1},53); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{1},162); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{1},164); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{1},62); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{1},66); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{2},211); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{2},216); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{2},293); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{3},248); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{3},251); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{3},292); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{3},25); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{4},118); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{4},122); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{4},16); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{4},19); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{5},206); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{5},208); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{5},224); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{5},225); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{6},99); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{6},101); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{6},102); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{6},130); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{7},136); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{7},138); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{7},144); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{7},113); i=i+1;
    listPhotosRatolis{i}=lookForRatoliImg(typeRatolis{3},nameRatolisTreated{7},115); 


cd Calling

end