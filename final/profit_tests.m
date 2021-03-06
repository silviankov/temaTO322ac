function [ profit ] = verificare_temaTO( Resursa1, Resursa2 )

% clear
% clc

%% formule

% ProdA = 1 unitate Res1, 0.2 unitati Res2
% ProdB = 0.5 unitate Res1, 0.5 unitati Res2

% Cost Res1 = 0.375 - 0.00005*nrRes1
% Cost Res2 = 0.75 - 0.0001*nrRes2

% Pret vanzare unitate ProdA = 2 - 0.0005*nrProdA - 0.00015*nrProdB
% Pret vanzare unitate ProdB = 3.5 - 0.0002*nrProdA - 0.0015*nrProdB
% SAU
% Profit vanzare ProdA   ?
% Profit vanzare ProdB   ?

%%

Res1 = Resursa1;
Res2 = Resursa2;

nrProdA = 0; 
nrProdB = 0; 

pretProdA = 0;
pretProdB = 0;

costRes1 = 0;
costRes2 = 0;

%% Teste pt productie maxima de A si de B

% max ProdA
nrMaxProdA = 0;
maxProdA_res1 = Res1/1;
maxProdA_res2 = Res2/0.2;
if (maxProdA_res1 <= maxProdA_res2) 
    nrMaxProdA = floor(maxProdA_res1);
else
    nrMaxProdA = floor(maxProdA_res2);
end

% max ProdB
nrMaxProdB = 0;
maxProdB_res1 = Res1/0.5;
maxProdB_res2 = Res2/0.5;
if (maxProdB_res1 <= maxProdB_res2) 
    nrMaxProdB = floor(maxProdB_res1);
else
    nrMaxProdB = floor(maxProdB_res2);
end

%tura Prod A
vecNrProdA = [0:nrMaxProdA];
profitProdAB = zeros(1,length(vecNrProdA));
nrProdB = 0;

vecNrProdB2 = [0:nrMaxProdA];
profitProdB2 = zeros(1,length(vecNrProdA));

for i = 1:length(vecNrProdA)
   
    nrProdA = vecNrProdA(i);
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
    
    vecNrProdB2(i) = nrMaxProdB2;
    
    %costRes1 = 0.375 - 0.00005*nrFolRes1; 
    %costRes2 = 0.75 - 0.0001*nrFolRes2;
    pretProdA = 2 - 0.0005*nrProdA - 0.00015*nrMaxProdB2;
    %profitProdA(i) = pretProdA*nrProdA - nrFolRes1*costRes1 - nrFolRes2*costRes2;
    
    %
    
    if (((Res1-nrFolRes1) >= 0)&&((Res2 - nrFolRes2) >= 0))
        nrFol2Res1 = 0.5*nrMaxProdB2;
        nrFol2Res2 = 0.5*nrMaxProdB2;
        cost2Res1 = 0.375 - 0.00005*(nrFol2Res1 + nrFolRes1); 
        cost2Res2 = 0.75 - 0.0001*(nrFol2Res2 + nrFolRes2);
        pretProdB = 3.5 - 0.0002*nrProdA - 0.0015*nrMaxProdB2;
        %profitProdB2(i) = pretProdB*nrMaxProdB2 - nrFol2Res1*cost2Res1 - nrFol2Res2*cost2Res2;
        profitProdAB(i) = pretProdB*nrMaxProdB2 + pretProdA*nrProdA - (nrFol2Res1 + nrFolRes1)*cost2Res1 - (nrFol2Res2 + nrFolRes2)*cost2Res2;
    end
end

% tura Prod B
vecNrProdB = [0:nrMaxProdB];
profitProdBA = zeros(1,length(vecNrProdB));
nrProdA = 0;

vecNrProdA2 = [0:nrMaxProdB];
profitProdA2 = zeros(1,length(vecNrProdB));

for i = 1:length(vecNrProdB)
   
    nrProdB = vecNrProdB(i);
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
    
    vecNrProdA2(i) = nrMaxProdA2;
    
    %costRes1 = 0.375 - 0.00005*nrFolRes1; 
    %costRes2 = 0.75 - 0.0001*nrFolRes2;
    pretProdB = 3.5 - 0.0002*nrMaxProdA2 - 0.0015*nrProdB;
    %profitProdB(i) = pretProdB*nrProdB - nrFolRes1*costRes1 - nrFolRes2*costRes2;
    
    %
    
    if (((Res1-nrFolRes1) >= 0)&&((Res2 - nrFolRes2) >= 0))
        nrFol2Res1 = 1*nrMaxProdA2;
        nrFol2Res2 = 0.2*nrMaxProdA2;
        cost2Res1 = 0.375 - 0.00005*(nrFol2Res1 + nrFolRes1); 
        cost2Res2 = 0.75 - 0.0001*(nrFol2Res2 + nrFolRes2);
        pretProdA = 2 - 0.0005*nrMaxProdA2 - 0.00015*nrProdB;
        %profitProdA2(i) = pretProdA*nrMaxProdA2 - (nrFol2Res1 + nrFolRes1)*cost2Res1 - (nrFol2Res2 + nrFolRes2)*cost2Res2;
        profitProdBA(i) = pretProdA*nrMaxProdA2 + pretProdB*nrProdB - (nrFol2Res1 + nrFolRes1)*cost2Res1 - (nrFol2Res2 + nrFolRes2)*cost2Res2;
    end
end

%% plotare
% figure
% subplot(2,1,1)
% plot(vecNrProdA, profitProdA, vecNrProdA, profitProdB2)
% xlabel('Nr produse A')
% ylabel('Profitul')
% title('Graficul profitului produsului A in functie de nr de vanzari, in comparatie cu profitul produselor B care mai pot fi fabricate pe langa')
% grid on
% legend('Profit Prod A', 'Profit Prod B')
% 
% subplot(2,1,2)
% plot(vecNrProdB, profitProdB, vecNrProdB, profitProdA2)
% xlabel('Nr produse B')
% ylabel('Profitul')
% title('Graficul profitului produsului B in functie de nr de vanzari, in comparatie cu profitul produselor A care mai pot fi fabricate pe langa')
% grid on
% legend('Profit Prod B', 'Profit Prod A')

% profitProdAB = profitProdA + profitProdB2;
% profitProdBA = profitProdB + profitProdA2;

figure
subplot(2,1,1)
plot(vecNrProdA, profitProdAB)
xlabel('Nr produse A')
ylabel('Profitul total')
title('Graficul profiturilor adunate ale produselor A si B cu productia de produs A dominanta')
grid on

subplot(2,1,2)
plot(vecNrProdB, profitProdBA)
xlabel('Nr produse B')
ylabel('Profitul total')
title('Graficul profiturilor adunate ale produselor A si B cu productia de produs B dominanta')
grid on

figure
subplot(2,1,1)
plot(vecNrProdA, vecNrProdB2)
xlabel('Nr produse A')
ylabel('Nr produse B')
title('Graficul produselor A si a produselor B care mai pot fi facute')
grid on

subplot(2,1,2)
plot(vecNrProdB, vecNrProdA2)
xlabel('Nr produse B')
ylabel('Nr produse A')
title('Graficul produselor B si a produselor A care mai pot fi facute')
grid on

%% aflarea celui mai mare profit

pozitieAB = 0;
maxProfitAB = 0;
for i = 1:length(profitProdAB)
    
    if (profitProdAB(i) >= maxProfitAB)
        maxProfitAB = profitProdAB(i);
        pozitieAB = i;
    end
end

%maxProfitAB

pozitieBA = 0;
maxProfitBA = 0;
for i = 1:length(profitProdBA)
    
    if (profitProdBA(i) >= maxProfitBA)
        maxProfitBA = profitProdBA(i);
        pozitieBA = i;
    end
end

%maxProfitBA

if (maxProfitAB >= maxProfitBA)
   
    fprintf('\n Cel mai mare profit (%d) se obtine cu %d produse A si %d produse B \n', maxProfitAB, vecNrProdA(pozitieAB), vecNrProdB2(pozitieAB))
    profit = maxProfitAB;

else
    
    fprintf('\n Cel mai mare profit (%d) se obtine cu %d produse B si %d produse A \n', maxProfitBA, vecNrProdB(pozitieBA), vecNrProdA2(pozitieBA))
    profit = maxProfitBA;
end

axaXA = [0:nrMaxProdA];
axaXB = [0:nrMaxProdB];

% figure
% subplot(2,1,1)
% plot(axaXA, profitProdAB, axaXA, vecNrProdA, axaXA, vecNrProdB2)
% xlabel('Pasi A')
% % ylabel('Profitul')
% title('Datele produsului A')
% grid on
% legend('Profit ProdAB', 'vecNrProdA', 'vecNrProdB2')
% 
% subplot(2,1,2)
% plot(axaXB, profitProdBA, axaXB, vecNrProdB, axaXB, vecNrProdA2)
% xlabel('Pasi B')
% % ylabel('Profitul')
% title('Datele produsului B')
% grid on
% legend('Profit ProdBA', 'vecNrProdB', 'vecNrProdA2')

% verificare_temaTO(2,125)
% verificare_temaTO(1,750)

end