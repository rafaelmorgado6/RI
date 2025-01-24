
%% Ex1

% command window: imageAcquisitionExplorer

%% Ex2

clear, close all, clc;

videoOS='winvideo';
info=imaqhwinfo(videoOS);
info.DeviceInfo %mostra infos do dispositivo
camnum=1;%numero da camara do bus (USB,firewire)
vid = videoinput(videoOS,camnum);%Objeto de video a usar
preview(vid); %Iniciar preview da camara

%% Ex3

clear, close all, clc;

videoOS='winvideo';
info=imaqhwinfo(videoOS);
info.DeviceInfo %mostra infos do dispositivo
camnum=1;%numero da camara do bus (USB,firewire)
vid = videoinput(videoOS,camnum);%Objeto de video a usar
%preview(vid); %Iniciar preview da camara

h = figure(1);

try
    while ishandle(h)
        frame = getsnapshot(vid);
        gray = rgb2gray(frame);
        bin = imbinarize(gray, 0.5);
        
        subplot(1, 3, 1);
        imshow(frame);
        title('Imagem RGB');
        
       
        subplot(1, 3, 2);
        imshow(gray);
        title('Imagem em Níveis de Cinza');
        
        subplot(1, 3, 3);
        imshow(bin);
        title('Imagem Binarizada a 50%');
    pause(0.01);
    end
catch
    stop(vid)
end

stop(vid)
delete(vid)

%% Ex4


clear, close all, clc;

videoOS='winvideo';
info=imaqhwinfo(videoOS);
info.DeviceInfo %mostra infos do dispositivo
camnum=1;%numero da camara do bus (USB,firewire)
cam=webcam(1); % Criar o device (camara 1)
%preview(cam); %Iniciar preview da camara

h = figure(1);

try
    while ishandle(h)
        frame = snapshot(cam);
        gray = rgb2gray(frame);
        bin = imbinarize(gray, 0.95);
        
        s = regionprops(bin, "Area", "Centroid");

        idx = find([s.Area] == max([s.Area]));

        
        subplot(1, 2, 1);
        hold on;
        imshow(frame);
        title('Imagem RGB');
        plot(s(idx).Centroid(1),s(1).Centroid(2),'*b');
       
        
        subplot(1, 2, 2);
        imshow(bin);
        title('Imagem Binarizada a 95%');

        


        disp(s);
    pause(0.01);
    end
catch
   clear cam
end

clear cam

