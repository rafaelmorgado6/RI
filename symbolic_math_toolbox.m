%% Symbolic Math Toolbox

% 1. Usando o comando syms, você pode declarar variáveis simbólicas.
syms x
f = x^2 + 3*x + 2;

% 2. Você pode resolver equações de forma simbólica sem precisar de números.
% Isso retorna as soluções simbólicas da equação ou seja, x=2 e x=-2
solve(x^2 - 4 == 0, x)

% 3. Ele facilita o cálculo de derivadas e integrais de forma simbólica.
diff(f, x)  % Derivada de f = x^2 + 3x + 2
int(f, x)   % Integral indefinida de f

% 4. Simplifica expressões matemáticas complicadas. 
simplify((x^2 - 4)/(x - 2))

% 5. Permite resolver equações diferenciais ordinárias (ODEs) e parciais (PDEs) simbolicamente.
syms y(t)
Dy = diff(y, t); % calcula a 1a derivada de y em relação a t
ode = diff(y, t, 2) + y == 0;  % Segunda derivada de y + y = 0
dsolve(ode)  % Solução simbólica

% 6. Expansão em séries de Taylor, transformadas de Laplace e Fourier, etc.
taylor(exp(x), x)