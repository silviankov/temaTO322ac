function [ profit ] = verificare_temaTO( verif, nrProd )
%VERIFICARE_TEMA_TO
% 322 AC 2016 - 2017

verif1 = verif;

Res1 = 1000;
Res2 = 250;

nrProdA = 0; 
nrProdB = 0; 

pretProdA = 0;
pretProdB = 0;

costRes1 = 0;
costRes2 = 0;

% max ProdA
nrMaxProdA = 0;
maxProdA_res1 = Res1/1;
maxProdA_res2 = Res2/0.2;
if (maxProdA_res1 <= maxProdA_res2) 
    nrMaxProdA = maxProdA_res1;
else
    nrMaxProdA = maxProdA_res2;
end

% max ProdB
nrMaxProdB = 0;
maxProdB_res1 = Res1/0.5;
maxProdB_res2 = Res2/0.5;
if (maxProdB_res1 <= maxProdB_res2) 
    nrMaxProdB = maxProdB_res1;
else
    nrMaxProdB = maxProdB_res2;

%%

if (verif1 == 1) 
   
    nrProdA = nrProd;
    nrFolRes1 = 1*nrProdA;
    nrFolRes2 = 0.2*nrProdA;
    
    nrMaxProdB2 = 0; %aflu cate produse B se mai pot face dupa ce se face nr prezent de produse A
    maxProdB2_res1 = (Res1 - nrFolRes1)/0.5;
    maxProdB2_res2 = (Res2 - nrFolRes2)/0.5;
    if (maxProdB2_res1 <= maxProdB2_res2) 
        nrMaxProdB2 = floor(maxProdB2_res1);
    else
        nrMaxProdB2 = floor(maxProdB2_res2);
    end
    
    nrProdA
    nrMaxProdB2

    nrRes1 = nrProdA*1 + 0.5*nrMaxProdB2;
    nrRes2 = nrProdA*0.2 + 0.5*nrMaxProdB2;

    costRes1 = 0.375 - 0.00005*nrRes1;
    costRes2 = 0.75 - 0.0001*nrRes2;
    
    pretProdA = 2 - 0.0005*nrProdA - 0.00015*nrMaxProdB2;
    pretProdB = 3.5 - 0.0002*nrProdA - 0.0015*nrMaxProdB2;

    profit = nrProdA*pretProdA + nrMaxProdB2*pretProdB - nrRes1*costRes1 - nrRes2*costRes2;
    
else
    
    nrProdB = nrProd;
    nrFolRes1 = 0.5*nrProdB;
    nrFolRes2 = 0.5*nrProdB;
    
    nrMaxProdA2 = 0; %aflu cate produse A se mai pot face dupa ce se face nr prezent de produse B
    maxProdA2_res1 = (Res1 - nrFolRes1)/1;
    maxProdA2_res2 = (Res2 - nrFolRes2)/0.2;
    if (maxProdA2_res1 <= maxProdA2_res2) 
        nrMaxProdA2 = floor(maxProdA2_res1);
    else
        nrMaxProdA2 = floor(maxProdA2_res2);
    end
    
    nrProdB
    nrMaxProdA2
    
    nrRes1 = nrProdB*1 + 0.5*nrMaxProdA2;
    nrRes2 = nrProdB*0.2 + 0.5*nrMaxProdA2;

    costRes1 = 0.375 - 0.00005*nrRes1;
    costRes2 = 0.75 - 0.0001*nrRes2;
    
    pretProdA = 2 - 0.0005*nrMaxProdA2 - 0.00015*nrProdB;
    pretProdB = 3.5 - 0.0002*nrMaxProdA2 - 0.0015*nrProdB;

    profit = nrMaxProdA2*pretProdA + nrProdB*pretProdB - nrRes1*costRes1 - nrRes2*costRes2;
end

end

