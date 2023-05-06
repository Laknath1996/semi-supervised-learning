function W = construct_adjacency_matrix(X, n)
    k = size(X, 1);             % number of total datapoints
    W = zeros(k, k);            % adjacency matrix
    parfor i=1:k
        for j=1:i
            if i == j
                continue;
            end

            dists1 = sum((X - X(i, :)).^2, 2);
            [~, sorted_indices1] = sort(dists1);
            sorted_indices1 = sorted_indices1(2:n+1);

            dists2 = sum((X - X(j, :)).^2, 2);
            [~, sorted_indices2] = sort(dists2);
            sorted_indices2 = sorted_indices2(2:n+1);

            if any(sorted_indices1 == j) || any(sorted_indices2 == i)
                W(i,j) = 1;
            end

%             nni = knnsearch(X, X(i, :), 'K', n);
%             nnj = knnsearch(X, X(j, :), 'K', n);
%             if any(nni == j) || any(nnj == i)
%                 W(i, j) = 1;
%             end
        end
    end
    W = triu(W.',1) + tril(W);
end