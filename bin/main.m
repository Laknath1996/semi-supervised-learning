clear all;
close all;

rawdata = load('DataSets/TrainImages.mat').TrainImages;
labels = load('DataSets/TrainImageLabels.mat').Labels;

rawdata = cast(rawdata, 'double');
rawdata = rawdata/255.0;
[~, score, ~] = pca(reshape(rawdata, [length(rawdata), size(rawdata, 2) * size(rawdata, 2)]));
data = score(1:end, 1:100);

s_list = [20, 50, 100, 500]; %, 1000, 5000, 20000, 50000];
p = 10;
n = 8;
num_reps = 1;

error_per_s = zeros(size(s_list));
for i=1:length(s_list)
    buffer = zeros([num_reps, 1]);
    for rep=1:num_reps
        indices = randperm(length(labels));
        indices = indices(1:1000);
        X = data(indices, :);
        Y = labels(indices);
        buffer(rep) = train(X, Y, s_list(i), p, n);
    end
    error_per_s(i) = mean(buffer);
    fprintf("Error at s = %i : %.3f \n", [s_list(i), error_per_s(i)])
end

plot(s_list, error_per_s);