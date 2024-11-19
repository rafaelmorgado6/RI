
clear, close all, clc

% Contagem regressiva de 3 até 1
fprintf('Programa vai começar em...\n'); % Mensagem final
pause(1);
for i = 3:-1:1
    fprintf('%d...\n', i); % Imprimir o número atual
    pause(1); % Pausar por 1 segundo (opcional)
end

fid = fopen(['tp1.2.cfg'], 'r');

if fid == -1
    error('Erro ao abrir o ficheiro.');
end

% Inicializar a matriz de ocupação
matriz_ocupacao = zeros(6,6,8);  % 0 representa espaço livre, 1 representa espaço ocupado
matriz_ocupacao(:,:,1) = 1;
matriz_ocupacao(1,1:2,2) = 1;
matriz_ocupacao(:,5:6,2) = 1;

NN = 5;
contador_1 = 0;
contador_2 = 0;
contador_3 = 0;
contador_4 = 0;
contador_5 = 0;
contador_6 = 0;
contador_7 = 0;
num_obj = 0;


count1=2;
count2=2;
count3=2;
count4=2;
count5=2;
count6=2;
count7=2;

figure('Position', [800, 80, 1100, 900]); % Exemplo com largura de 800 e altura de 600 pixels
view(135, 25); % Definindo a visualização 3D está fora do while para podermos girar o grafico
axis equal;
axis([0 6 0 6 0 8]);
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');

% Ajustar os ticks para que apareçam de 1 em 1
xticks(0:1:6);
yticks(0:1:6);
zticks(0:1:8);



while true
    
    object = fgetl(fid);  % Lê a linha atual
    num_obj = num_obj + 1 ;
    
    if ~ischar(object)          % Verifica se ainda há linhas para ler
        break;                  % Sai do loop se não houver mais linhas
    end
   
    T(:,:,1) = eye(4,4);
    ord = 0;
    
%----------------------------------------------------------------------------    
%---------------------> 1ª 14 peças <---------------------------------------- 
%----------------------------------------------------------------------------

    if num_obj <= 14
        switch object
         case '1'
             [V,F,h] = fig_1();
             clear T; 
             clear ord;
    
             T(:,:,:,1) = mhtrans(0,linspace(0,1,NN),0);
             T(:,:,:,2) = mhrotz(linspace(0,-pi/2,NN));
             T(:,:,:,3) = mhtrans(linspace(0,2,NN),linspace(0,5,NN), 0);
             
             if contador_1 == 0   
                T(:,:,:,4) = mhtrans(0,0,linspace(0,-8,NN));
             elseif contador_1 == 1
                T(:,:,:,4) = mhtrans(0,0,linspace(0,-7,NN));
             end
             ord = [0, 1, 0 , 0];
             contador_1 = contador_1 + 1;
             
         case '2'
             [V,F,h] = fig_2();
             clear T; 
             clear ord;       
    
             if contador_2 == 0
                T(:,:,:,1) = mhtrans(linspace(0,5,NN),0,0);
                T(:,:,:,2) = mhroty(linspace(0,-pi/2,NN));
                T(:,:,:,3) = mhtrans(linspace(0,1,NN),0,0);
                T(:,:,:,4) = mhtrans(0,0,linspace(0,-8,NN));
                ord = [0, 1, 0, 0];
             elseif contador_2 == 1
                T(:,:,:,1) = mhtrans(0,linspace(0,1,NN),0);
                T(:,:,:,2) = mhrotz(linspace(0,-pi/2,NN));
                T(:,:,:,3) = mhtrans(linspace(0,2,NN),linspace(0,1,NN),0);
                T(:,:,:,4) = mhroty(linspace(0,-pi/2,NN));
                T(:,:,:,5) = mhtrans(0,linspace(0,-2,NN),0);
                T(:,:,:,6) = mhtrans(0,0,linspace(0,-8,NN));
                ord = [0, 1, 0, 1, 0, 0];
             end
             contador_2 = contador_2 + 1;  
             
         case '3'
             [V,F,h] = fig_3();
             clear T; 
             clear ord;
            
             if contador_3 == 0
                T(:,:,:,1) = mhtrans(linspace(0,3,NN),linspace(0,3,NN),0);
                T(:,:,:,2) = mhrotz(linspace(0,-pi/2,NN));
                T(:,:,:,3) = mhtrans(linspace(0,-3,NN),linspace(0,3,NN),0);
                T(:,:,:,4) = mhtrans(0, 0,linspace(0,-8,NN));
                ord = [0, 1, 0, 0];
             elseif contador_3 == 1
                T(:,:,:,1) = mhtrans(linspace(0,2,NN),linspace(0,4,NN),0);
                T(:,:,:,2) = mhroty(linspace(0,pi,NN));
                T(:,:,:,3) = mhtrans(0, 0, linspace(0,-6,NN));
                ord = [0, 1, 0];
             end
             contador_3 = contador_3 + 1;
    
         case '4'
             [V,F,h] = fig_4();
             clear T; 
             clear ord;
      
             if contador_4 == 0
                T(:,:,:,1) = mhtrans(0,linspace(0,2,NN),0);
                T(:,:,:,2) = mhrotz(linspace(0,-pi/2,NN));
                T(:,:,:,3) = mhtrans(linspace(0,1,NN),0,0);
                T(:,:,:,4) = mhroty(linspace(0,pi/2,NN));
                T(:,:,:,5) = mhtrans(0,0,linspace(0,-7,NN));
                ord = [0, 1, 0, 1, 0];
                
             elseif contador_4 == 1
                T(:,:,:,1) = mhtrans(0,linspace(0,2,NN),0);
                T(:,:,:,2) = mhrotz(linspace(0,-pi/2,NN));
                T(:,:,:,3) = mhtrans(linspace(0,1,NN),0,0);
                T(:,:,:,4) = mhroty(linspace(0,pi/2,NN));
                T(:,:,:,5) = mhtrans(linspace(0,-1,NN),linspace(0,2,NN),0);
                T(:,:,:,6) = mhtrans(0,0,linspace(0,-7,NN));
                ord = [0, 1, 0, 1, 0, 0];
             end
             contador_4 = contador_4 + 1;

         case '5'
             [V,F,h] = fig_5();
             clear T; 
             clear ord;
    
             if contador_5 == 0
                T(:,:,:,1) = mhtrans(linspace(0,4,NN),linspace(0,4,NN),0);
                T(:,:,:,2) = mhrotz(linspace(0,-pi/2,NN));
                T(:,:,:,3) = mhtrans(0,linspace(0,1,NN),0);
                T(:,:,:,4) = mhtrans(0,0,linspace(0,-8,NN));
                ord = [0, 1, 0, 0];
             elseif contador_5 == 1
                T(:,:,:,1) = mhtrans(linspace(0,2,NN),linspace(0,4,NN),0);
                T(:,:,:,2) = mhrotz(linspace(0,-pi/2,NN));
                T(:,:,:,3) = mhtrans(0,linspace(0,1,NN),0);
                T(:,:,:,4) = mhtrans(0,0,linspace(0,-8,NN));
                ord = [0, 1, 0, 0];
             end
             contador_5 = contador_5 + 1;

         case '6' 
             [V,F,h] = fig_6();
             clear T; 
             clear ord;
       
             if contador_6 == 0
                T(:,:,:,1) = mhtrans(0,0,linspace(0,-8,NN));
                ord = 0;
             elseif contador_6 == 1
                T(:,:,:,1) = mhtrans(0,0,linspace(0,-7,NN));
                ord = 0;
             end
             contador_6 = contador_6 + 1;
    
         case '7'
             [V,F,h] = fig_7();
             clear T; 
             clear ord;
       
             if mod(contador_7,2) == 0
                T(:,:,:,1) = mhtrans(linspace(0,3,NN),linspace(0,2,NN),0);
                T(:,:,:,2) = mhrotz(linspace(0,-pi/2,NN));
                T(:,:,:,3) = mhroty(linspace(0,-pi/2,NN));
                T(:,:,:,4) = mhtrans(0, 0,linspace(0,-8,NN));
                ord = [0, 1, 1, 0];
             elseif mod(contador_7,2) == 1
                T(:,:,:,1) = mhtrans(linspace(0,1,NN),linspace(0,2,NN),0);
                T(:,:,:,2) = mhrotz(linspace(0,-pi/2,NN));
                T(:,:,:,3) = mhroty(linspace(0,-pi/2,NN));
                T(:,:,:,4) = mhtrans(0,0,linspace(0,-8,NN));
                ord = [0, 1, 1, 0];
             end
             contador_7 = contador_7 + 1;
         otherwise
             error('Objeto inválido.');
        end

%---------------------------------------------------------------------------------
%---------------------> Restantes peças <-----------------------------------------
%---------------------------------------------------------------------------------

    else   
       
        switch object
             case '1'
                 [V,F,h] = fig_1();
                 clear T; 
                 clear ord;
                 flag=0;
                 for Z = 1:8
                    for X = 1:6
                        for Y = 1:6
                             if  Y <= 3 && all(matriz_ocupacao(X, Y:Y+3, Z) == 0)
                                matriz_ocupacao(X, Y:Y+3, Z) = 1;
                                T(:,:,:,1) = mhtrans(linspace(0,X-1,NN),linspace(0,Y-1,NN),0);
                                T(:,:,:,2) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [0, 0];
                                flag=1;
                             elseif X <=3 && all(matriz_ocupacao(X:X+3, Y, Z) == 0)
                                matriz_ocupacao(X:X+3, Y, Z) = 1;
                                T(:,:,:,1) = mhrotz(linspace(0,-pi/2,NN));
                                T(:,:,:,2) = mhtrans(linspace(0,X-1,NN),linspace(0,Y,NN),0);
                                T(:,:,:,3) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [1,0,0];
                                flag=1;
                             end
                             if flag
                                break
                             end
                        end
                        if flag
                           break
                        end
                    end
                    if flag
                       break
                    end
                 end
                 count1=count1+1;

             case '2'
                 [V,F,h] = fig_2();
                 clear T; 
                 clear ord;
                 flag=0;
                 for Z = 1:8
                    for X = 1:6
                        for Y = 1:6
                             if  Y <=4 && all(matriz_ocupacao(X, Y:Y+2, Z) == 0)
                                matriz_ocupacao(X, Y:Y+2, Z) = 1;
                                matriz_ocupacao(X, Y+1, Z+1) = 1;
                                T(:,:,:,1) = mhtrans(linspace(0,X-1,NN),linspace(0,Y-1,NN),0);
                                T(:,:,:,2) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [0,0];
                                flag=1;
                             elseif  X <=4 && all(matriz_ocupacao(X:X+2, Y, Z) == 0)
                                matriz_ocupacao(X:X+2, Y, Z) = 1;
                                matriz_ocupacao(X+1, Y, Z+1) = 1;
                                T(:,:,:,1) = mhrotz(linspace(0,-pi/2,NN));
                                T(:,:,:,2) = mhtrans(linspace(0,X-1,NN),linspace(0,Y,NN),0);
                                T(:,:,:,3) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [1,0,0];
                                flag=1;
                             elseif  X ~=6 && Y <=4 && all(matriz_ocupacao(X, Y:Y+2, Z) == 0) && all(matriz_ocupacao(X:X+1, Y+1, Z) == 0)
                                 matriz_ocupacao(X, Y:Y+2, Z) = 1;
                                matriz_ocupacao(X:X+1, Y+1, Z) = 1;
                                T(:,:,:,1) = mhroty(linspace(0,pi/2,NN));
                                T(:,:,:,2) = mhtrans(linspace(0,X-1,NN),linspace(0,Y-1,NN),0);
                                T(:,:,:,3) = mhtrans(0,0,linspace(0,-8+Z,NN));
                                ord = [1,0,0];
                                flag=1;
                             end
                             if flag
                                break
                             end
                        end
                        if flag
                           break
                        end
                    end
                    if flag
                       break
                    end
                 end
                 count2=count2+1;

             case '3'
                 [V,F,h] = fig_3();
                 clear T; 
                 clear ord;
                 flag=0;
                 for Z = 1:8
                    for X = 1:6
                        for Y = 1:6
                             if Y <= 5 && X <= 5 && all(all(matriz_ocupacao(X:X+1, Y:Y+1, Z) == 0))
                                matriz_ocupacao(X:X+1, Y:Y+1, Z) = 1;
                                matriz_ocupacao(X, Y, Z+1) = 1;
                                T(:,:,:,1) = mhtrans(linspace(0,X-1,NN),linspace(0,Y-1,NN),0);
                                T(:,:,:,2) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [0,0];
                                flag=1;
                             elseif Y > 1 && X > 1 && Z > 1 && all(all(matriz_ocupacao(X-1:X, Y-1:Y, Z) == 0)) && all(all(matriz_ocupacao(X, Y, Z-1) == 0))
                                matriz_ocupacao(X-1:X, Y, Z) = 1;
                                matriz_ocupacao(X, Y-1:Y, Z) = 2;
                                matriz_ocupacao(X, Y, Z-1) = 1;
                                T(:,:,:,1) = mhroty(linspace(0,pi,NN));
                                T(:,:,:,2) = mhrotz(linspace(0,-pi/2,NN));
                                T(:,:,:,3) = mhtrans(linspace(0,X-1,NN),linspace(0,Y,NN),0);
                                T(:,:,:,4) = mhtrans(0,0,linspace(0,-8+Z,NN));
                                ord = [1,1,0,0];
                                flag=1;
                              end
                             if flag
                                break
                             end
                        end
                        if flag
                           break
                        end
                    end
                   if flag
                           break
                    end
                 end
                 count3=count3+1;
                
             case '4'
                 [V,F,h] = fig_4();
                 clear T; 
                 clear ord;
                 flag=0;
                 for Z = 1:8
                    for X = 1:6
                        for Y = 1:6
                            if  X ~=6 && Y ~=6 && all(all(matriz_ocupacao(X:X+1, Y:Y+1, Z) == 0))
                                matriz_ocupacao(X:X+1, Y:Y+1, Z) = 1;
                                T(:,:,:,1) = mhroty(linspace(0,pi/2,NN));
                                T(:,:,:,2) = mhtrans(linspace(0,X-1,NN),linspace(0,Y-1,NN),0);
                                T(:,:,:,3) = mhtrans(0,0,linspace(0,-8+Z,NN));
                                ord = [1,0,0];
                                flag=1;
                           elseif  Y ~=6 && all(matriz_ocupacao(X, Y:Y+1, Z) == 0)
                                matriz_ocupacao(X, Y:Y+1, Z) = 1;
                                matriz_ocupacao(X, Y, Z+1) = 1;
                                T(:,:,:,1) = mhtrans(linspace(0,X-1,NN),linspace(0,Y-1,NN),0);
                                T(:,:,:,2) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [0,0];
                                flag=1;
                            elseif  X ~=6 && all(matriz_ocupacao(X:X+1, Y, Z) == 0)
                                matriz_ocupacao(X:X+1, Y, Z) = 1;
                                matriz_ocupacao(X, Y, Z+1) = 1;
                                T(:,:,:,1) = mhrotz(linspace(0,-pi/2,NN));
                                T(:,:,:,2) = mhtrans(linspace(0,X-1,NN),linspace(0,Y,NN),0);
                                T(:,:,:,3) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [1,0,0];
                                flag=1;
                            elseif  Y ~= 6 && all(matriz_ocupacao(X, Y:Y+1, Z) == 0) && all(matriz_ocupacao(X, Y+1, Z-1:Z) == 0)
                                matriz_ocupacao(X, Y:Y+1, Z) = 2;
                                matriz_ocupacao(X, Y+1, Z-1) = 2;
                                T(:,:,:,1) = mhrotx(linspace(0,pi,NN));
                                T(:,:,:,2) = mhtrans(linspace(0,X-1,NN),linspace(0,Y+1,NN),0);
                                T(:,:,:,3) = mhtrans(0,0,linspace(0,-8+Z,NN));
                                ord = [1,0,0];
                                flag=1;
                             end
                             if flag
                                break
                             end
                        end
                        if flag
                           break
                        end
                    end
                   if flag
                           break
                    end
                 end
                 count4=count4+1;
                 
             case '5'
                 [V,F,h] = fig_5();
                 clear T; 
                 clear ord;
                 flag=0;
                 for Z = 1:8
                    for X = 1:6
                        for Y = 1:6
                             if Y ~= 6 && X ~= 6 && all(all(matriz_ocupacao(X:X+1, Y:Y+1, Z) == 0))
                                matriz_ocupacao(X:X+1, Y:Y+1, Z) = 1;
                                T(:,:,:,1) = mhroty(linspace(0,pi/2,NN));
                                T(:,:,:,2) = mhtrans(linspace(0,X-1,NN),linspace(0,Y-1,NN),0);
                                T(:,:,:,3) = mhtrans(0,0,linspace(0,-8+Z,NN));
                                ord = [1,0,0];
                                flag=1;   
                             elseif  Y ~= 6 && all(matriz_ocupacao(X, Y:Y+1, Z) == 0)
                                matriz_ocupacao(X, Y:Y+1, Z:Z+1) = 1;
                                T(:,:,:,1) = mhtrans(linspace(0,X-1,NN),linspace(0,Y-1,NN),0);
                                T(:,:,:,2) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [0,0];
                                flag=1;
                             elseif X ~= 6 && all(matriz_ocupacao(X:X+1, Y, Z) == 0)
                                matriz_ocupacao(X:X+1, Y, Z:Z+1) = 1;
                                T(:,:,:,1) = mhrotz(linspace(0,-pi/2,NN));
                                T(:,:,:,2) = mhtrans(linspace(0,X-1,NN),linspace(0,Y,NN),0);
                                T(:,:,:,3) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [1,0,0];
                                flag=1;
                             end
                             if flag
                                break
                             end
                        end
                        if flag
                           break
                        end
                    end
                    if flag
                       break
                    end
                 end
                 count5=count5+1;
                 
             case '6'
                 [V,F,h] = fig_6();
                 clear T; 
                 clear ord;
                 flag=0;
                 for Z = 1:8
                    for X = 1:6
                        for Y = 1:6
                             if  Y ~= 6 && all(matriz_ocupacao(X, Y:Y+1, Z) == 0)
                                matriz_ocupacao(X, Y:Y+1, Z) = 1;
                                T(:,:,:,1) = mhtrans(linspace(0,X-1,NN),linspace(0,Y-1,NN),0);
                                T(:,:,:,2) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [0,0];
                                flag=1;
                             elseif X ~= 6 && all(matriz_ocupacao(X:X+1, Y, Z) == 0)
                                matriz_ocupacao(X:X+1, Y, Z) = 1;
                                T(:,:,:,1) = mhrotz(linspace(0,-pi/2,NN));
                                T(:,:,:,2) = mhtrans(linspace(0,X-1,NN),linspace(0,Y,NN),0);
                                T(:,:,:,3) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [1,0,0];
                                flag=1;
                             elseif Z ~= 8 && all(matriz_ocupacao(X, Y, Z:Z+1) == 0)
                                matriz_ocupacao(X, Y, Z:Z+1) = 1;
                                T(:,:,:,1) = mhrotx(linspace(0,pi/2,NN));
                                T(:,:,:,2) = mhtrans(linspace(0,X-1,NN),linspace(0,Y,NN),0);
                                T(:,:,:,3) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [1,0,0];
                                flag=1;
                             end
                             if flag
                                break
                             end
                        end
                        if flag
                           break
                        end
                    end
                    if flag
                       break
                    end
                 end
                count6=count6+1;

             case '7'
                 [V,F,h] = fig_7();
                 clear T; 
                 clear ord;
                 flag=0;
                 for Z = 1:8
                    for X = 1:6
                        for Y = 1:6
                             if  Y <=3 && all(matriz_ocupacao(X, Y:Y+1, Z) == 0)&& all(matriz_ocupacao(X, Y+2, Z) == 1)
                                matriz_ocupacao(X, Y:Y+1, Z) = 1;
                                matriz_ocupacao(X, Y+1:Y+2, Z+1) = 1;
                                T(:,:,:,1) = mhtrans(linspace(0,X-1,NN),linspace(0,Y-1,NN),0);
                                T(:,:,:,2) = mhtrans(0,0,linspace(0,-9+Z,NN));
                                ord = [0,0];
                                flag=1;
                             end
                             if flag
                                break
                             end
                        end
                        if flag
                           break
                        end
                    end
                    if flag
                       break
                    end
                 end
                 count7=count7+1;        
        end                
    end
    
    set(h, 'Clipping', 'off');
    V = [V ones(size(V,1),1)]';
    
    Tcurr = mhtrans(0, 0, 8);  % Aplica a translação inicial
    
    for n=1:size(T,4)
        Tcurr = manimate(h, V, Tcurr, T(:,:,:,n), ord(n));
    end
end  

count_total=count1+count2+count3+count4+count5+count6+count7;
fprintf('\nContagem de peças:\n');
fprintf('Peça 1 - %d vezes\n', count1);
fprintf('Peça 2 - %d vezes\n', count2);
fprintf('Peça 3 - %d vezes\n', count3);
fprintf('Peça 4 - %d vezes\n', count4);
fprintf('Peça 5 - %d vezes\n', count5);
fprintf('Peça 6 - %d vezes\n', count6);
fprintf('Peça 7 - %d vezes\n', count7);
fprintf('Total - %d peças\n\n', count_total);

% Loop para verificar cada camada da última (8) até a primeira (1)
for k = size(matriz_ocupacao, 3):-1:1
    % Contar o número de elementos iguais a 1 na camada k
    num_ones = sum(sum(matriz_ocupacao(:, :, k) == 1));
    num_total = numel(matriz_ocupacao(:, :, k));  % Total de elementos na camada
    
    % Verificar se a camada está completa ou quantos espaços faltam
    if num_ones == num_total
        fprintf('Camada %d: Completa\n', k);
    else
        num_zeros = num_total - num_ones;
        fprintf('Camada %d: Incompleta - faltam %d espaços\n', k, num_zeros);
    end
end


fclose(fid);            
