function [Alpha_score, Alpha_pos, Convergence_curve] = GWO(SearchAgents_no, Max_iter, lb, ub, dim, fobj)

Alpha_pos = zeros(1,dim);
Alpha_score = inf;

Beta_pos = zeros(1,dim);
Beta_score = inf;

Delta_pos = zeros(1,dim);
Delta_score = inf;

Positions = rand(SearchAgents_no,dim).*(ub-lb)+lb;
Convergence_curve = zeros(1,Max_iter);

t = 0;

while t < Max_iter
    for i = 1:size(Positions,1)

        Positions(i,:) = max(Positions(i,:),lb);
        Positions(i,:) = min(Positions(i,:),ub);

        fitness = fobj(Positions(i,:));

        if fitness < Alpha_score
            Alpha_score = fitness;
            Alpha_pos = Positions(i,:);
        elseif fitness < Beta_score
            Beta_score = fitness;
            Beta_pos = Positions(i,:);
        elseif fitness < Delta_score
            Delta_score = fitness;
            Delta_pos = Positions(i,:);
        end
    end

    a = 2 - t * (2 / Max_iter);

    for i = 1:size(Positions,1)
        for j = 1:size(Positions,2)

            r1 = rand(); r2 = rand();
            A1 = 2*a*r1 - a;
            C1 = 2*r2;
            D_alpha = abs(C1*Alpha_pos(j) - Positions(i,j));
            X1 = Alpha_pos(j) - A1*D_alpha;

            r1 = rand(); r2 = rand();
            A2 = 2*a*r1 - a;
            C2 = 2*r2;
            D_beta = abs(C2*Beta_pos(j) - Positions(i,j));
            X2 = Beta_pos(j) - A2*D_beta;

            r1 = rand(); r2 = rand();
            A3 = 2*a*r1 - a;
            C3 = 2*r2;
            D_delta = abs(C3*Delta_pos(j) - Positions(i,j));
            X3 = Delta_pos(j) - A3*D_delta;

            Positions(i,j) = (X1 + X2 + X3) / 3;
        end
    end

    t = t + 1;
    Convergence_curve(t) = Alpha_score;
end

end
