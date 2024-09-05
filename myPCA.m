function [principalComponents, eigenvalues, projectedData] = myPCA(data)
    % Calculate the covariance matrix
    covarianceMatrix = cov(data);

    % Calculate the eigenvectors and eigenvalues
    [eigenvectors, eigenvalues] = eig(covarianceMatrix);

    % Sort eigenvectors based on eigenvalues
    [~, index] = sort(diag(eigenvalues), 'descend');
    eigenvectors = eigenvectors(:, index);

    % Project data onto the new space spanned by the principal components
    projectedData = data * eigenvectors;

    % Return principal components, eigenvalues, and projected data
    principalComponents = eigenvectors;
    eigenvalues = diag(eigenvalues);
end
