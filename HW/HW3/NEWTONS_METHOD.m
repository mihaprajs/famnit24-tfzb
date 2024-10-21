function alpha_optimal = NEWTONS_METHOD(eta, initial_guess, tol, max_iter)
    f = @(alpha) cos(alpha) ./ sin(alpha) + eta ./ sin(alpha);
    f_prime = @(alpha) -1 ./ sin(alpha).^2 + eta .* cos(alpha) ./ sin(alpha).^2;
    alpha = initial_guess;

    for iter = 1:max_iter
        alpha_new = alpha - f(alpha) / f_prime(alpha);
        if abs(alpha_new - alpha) < tol
            alpha_optimal = alpha_new;
            return;
        end        
        alpha = alpha_new;
    end
    alpha_optimal = alpha;
end