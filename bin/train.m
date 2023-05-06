function error = train(data, labels, s, p, n)
    classes = unique(labels);
    X = data;
    Y = labels;

    t1 = tic;
    W = construct_adjacency_matrix(X, n);
    fprintf("Time taken to construct adjacency matrix: %.3f \n", toc(t1));

    D = diag(sum(W, 2));
    L = D - W;

    t1 = tic;
    [U, ~] = eig(L);
    fprintf("Time taken to compute eigenvectors: %.3f \n", toc(t1));

    E = U(1:s, 1:p);
    conf = [];
    for i=1:length(classes)
        Y(labels == classes(i)) = 1; Y(labels ~= classes(i)) = -1;
        a = pinv(E) * Y(1:s)';
        conf = [conf , sum(U(s+1:end, 1:p).*a', 2)];
    end
    [~, argmax] = max(conf, [], 2);
    pred_labels = argmax - 1;
    error = mean(labels(s+1:end) ~= pred_labels');
end

    