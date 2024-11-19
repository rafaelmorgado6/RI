
clear, close all, clc

try
    tfid = fopen('tp2.txt');
    tdata = textscan(tfid,'%s=%s');
    fclose(tfid);
    if( numel(tdata{1}) ~= numel(tdata{2}))
        disp('Error reading file. Missing = !')
        clear tdata tfid
    else
        ndata={ tdata{1} repmat('=', size(tdata{1})) tdata{2}};
        sdata=strcat(ndata{1},ndata{2},ndata{3});
        for i=1:numel(sdata)
            try
                eval(sdata{i});
            catch
                sprintf('Bad format in line %d of data file!',i)
            end
        end
        clear i tfid ndata tdata sdata
    end
catch
    disp('Cannot open file.')
end

clc;
t = [0 0];

DH = [0 0 H pi/2   % Elo 0
      pi/4 0 H 0];  % Elo 1

hold on
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
view(135, 40);
axis equal;
axis([-3000 3000 -2000 2000 0 3000]);

Table_A(LTF, WTS, HTA, DTF, STF);
Table_B(LTF, WTS, HTB, DTF, STF);
Table_C(LTT, WTS, HTC, STF, LTF, DTF, DTT);

[P,F] = seixos3(500); % Amplia o tamanho dos eixos em 5 vezes
AA = Tlinks(DH);
Org = LinkOrigins(AA);
DrawLinks(Org);
DrawFrames(AA, P, F);
