% Define your cost function which is (MPPT for PV system @obj)
% ANN size is 36 variables
% Set GWO parameters (population size (GW), maximum iterations (Step))
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n (ANN = 36)
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n (ANN = 36)

GW=45;
S=400;
dim=36;
lb =  [-10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10 -10];   % Lower Bound of Decision Variables
ub =  [100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100];   % Upper Bound of Decision Variables


% Define GWO main file. Then:

[Best_score,x,GWO_cg_curve]=GWO(GW,S,lb,ub,dim,@obj);

assignin('base','w1',x(1))
assignin('base','w2',x(2))
assignin('base','w3',x(3))
assignin('base','w4',x(4))
assignin('base','w5',x(5))
assignin('base','w6',x(6))
assignin('base','w7',x(7))
assignin('base','w8',x(8))
assignin('base','w9',x(9))
assignin('base','w10',x(10))
assignin('base','w11',x(11))
assignin('base','w12',x(12))
assignin('base','w13',x(13))
assignin('base','w14',x(14))
assignin('base','w15',x(15))
assignin('base','w16',x(16))
assignin('base','w17',x(17))
assignin('base','w18',x(18))
assignin('base','w19',x(19))
assignin('base','w20',x(20))
assignin('base','w21',x(21))
assignin('base','w22',x(22))
assignin('base','w23',x(23))
assignin('base','w24',x(24))
assignin('base','w25',x(25))
assignin('base','w26',x(26))
assignin('base','w27',x(27))
assignin('base','w28',x(28))
assignin('base','w29',x(29))
assignin('base','w30',x(30))
assignin('base','w31',x(31))
assignin('base','w32',x(32))
assignin('base','w33',x(33))
assignin('base','w34',x(34))
assignin('base','w35',x(35))
assignin('base','w36',x(36))
disp('     w1---------w36')
disp(x) 
disp('  Best_score')
disp(Best_score)


%save x.mat x 
%disp('-----------------------------------------------------------')

function Err=obj(x)
assignin('base','w1',x(1))
assignin('base','w2',x(2))
assignin('base','w3',x(3))
assignin('base','w4',x(4))
assignin('base','w5',x(5))
assignin('base','w6',x(6))
assignin('base','w7',x(7))
assignin('base','w8',x(8))
assignin('base','w9',x(9))
assignin('base','w10',x(10))
assignin('base','w11',x(11))
assignin('base','w12',x(12))
assignin('base','w13',x(13))
assignin('base','w14',x(14))
assignin('base','w15',x(15))
assignin('base','w16',x(16))
assignin('base','w17',x(17))
assignin('base','w18',x(18))
assignin('base','w19',x(19))
assignin('base','w20',x(20))
assignin('base','w21',x(21))
assignin('base','w22',x(22))
assignin('base','w23',x(23))
assignin('base','w24',x(24))
assignin('base','w25',x(25))
assignin('base','w26',x(26))
assignin('base','w27',x(27))
assignin('base','w28',x(28))
assignin('base','w29',x(29))
assignin('base','w30',x(30))
assignin('base','w31',x(31))
assignin('base','w32',x(32))
assignin('base','w33',x(33))
assignin('base','w34',x(34))
assignin('base','w35',x(35))
assignin('base','w36',x(36))

simout=sim('ANNmtwoinputsn.slx'); %% To capture the error, need to run the Simulink file.
  
 e=abs(e2);
  e1=sum(e);  
  ep1=abs(ep);
  ep2=sum(ep1);
Err=0.2*(e1)+0.5*(ep2) %Note (0.2 and 0.5 can be changed (adjust as needed)) 
end