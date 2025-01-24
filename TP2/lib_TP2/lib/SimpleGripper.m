function [V, F, h] = SimpleGripper()
  
    V = [
         0 0 0; %1
         0 0 0    %2
         -50 0 0  %3
         50 0 0   %4
         -50 0 50  %5
         50 0 50   %6
    ];

   
    F = [
        1 2 2 2 ; 
        3 4 4 4; 
        5 3 3 3;  
        6 4 4 4 
    ];

    
    h = patch('Vertices', V, 'Faces', F, 'FaceColor', 'black', 'EdgeColor', 'black', 'LineWidth', 2);
end
