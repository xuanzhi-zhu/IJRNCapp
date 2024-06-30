function [] = fcn_3d_animation_all(t,r3,r3d,z1)

%actual p
pr = zeros(3,length(t));
for i=1:1:length(t)
    pr(:,i) = fcn_pr(t(i));
end
p=z1+pr;
p=p';
pr=pr';

%Rotation matrix
aux=[1,2,3]'; %?????????????????????????????????????????????
aux=aux./norm(aux);
r1 = aux;
R=zeros(3,3,length(t));
for i=1:1:length(t)
    R(:,:,i) = [skew(r3(:,i))*(skew(r1)*r3(:,i)),skew(r1)*r3(:,i),r3(:,i)];
end

%3d animation
figure(4);
hh=figure(4);

axis([min(p(:,1))-0.2,max(p(:,1))+0.2,min(p(:,2))-0.2,max(p(:,2))+0.2,min(p(:,3))-0.1,max(p(:,3))+0.1]);
set(gca,'ZDir','reverse')
set(gca,'XDir','reverse')
% % plot3(P_E_desired(:,2),P_E_desired(:,3),P_E_desired(:,4));

xlabel('$\textbf{x}$ (m)', 'Interpreter', 'latex', 'Fontsize', 12);
ylabel('$\textbf{y}$ (m)', 'Interpreter', 'latex', 'Fontsize', 12);
zlabel('$\textbf{z}$ (m)', 'Interpreter', 'latex', 'Fontsize', 12);
grid on
axis equal

%quadrotor
a=0.3;h=0.1;
vert_link1=...
[  1/2*a, 1/2*a,   -h;
   1/2*a, 5/2*a,   -h;
   -1/2*a, 5/2*a,   -h;
   -1/2*a, 1/2*a,   -h;
   -5/2*a, 1/2*a,   -h;
   -5/2*a, -1/2*a,   -h;
   -1/2*a, -1/2*a,   -h;
   -1/2*a, -5/2*a,   -h;
   1/2*a, -5/2*a,   -h;
   1/2*a, -1/2*a,   -h;
   5/2*a, -1/2*a,   -h;
   5/2*a, 1/2*a,   -h;
   1/2*a, 1/2*a,   h;
   1/2*a, 5/2*a,   h;
   -1/2*a, 5/2*a,   h;
   -1/2*a, 1/2*a,   h;
   -5/2*a, 1/2*a,   h;
   -5/2*a, -1/2*a,   h;
   -1/2*a, -1/2*a,   h;
   -1/2*a, -5/2*a,   h;
   1/2*a, -5/2*a,   h;
   1/2*a, -1/2*a,   h;
   5/2*a, -1/2*a,   h;
   5/2*a, 1/2*a,   h];

face_links1=...
[
1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12;    
13,14,15,16,17,18,19,20,21,22,23,24;    
 1, 2,14,13,13,13,13,13,13,13,13,13;    
 2, 3,15,14,14,14,14,14,14,14,14,14;    
 3, 4,16,15,15,15,15,15,15,15,15,15;    
 4, 5,17,16,16,16,16,16,16,16,16,16;    
 5, 6,18,17,17,17,17,17,17,17,17,17;    
 6, 7,19,18,18,18,18,18,18,18,18,18;    
 7, 8,20,19,19,19,19,19,19,19,19,19;    
 8, 9,21,20,20,20,20,20,20,20,20,20;    
 9,10,22,21,21,21,21,21,21,21,21,21;    
10,11,23,22,22,22,22,22,22,22,22,22;    
11,12,24,23,23,23,23,23,23,23,23,23;    
12, 1,13,24,24,24,24,24,24,24,24,24
];

% %actual position
% a2=0.02;
% vert_link2=...
% [  0, 0, 0;
%    0, a2,0;
%   a2, 0,0;
%    0, 0,a2;
%   a2,a2,0;
%    0, a2,a2;
%    a2,0,a2;
%    a2, a2,a2];
% 
% face_links2=...
% [1,2,5,3;
%  4,6,8,7;
%  1,3,7,4;
%  2,5,8,6;
%  3,5,8,7;
%  1,2,6,4];
% 
% %reference
% vert_link3=1.5.*vert_link2;
% face_links3=face_links2;

for i=1:1:length(t)

    aux_vert1=[vert_link1,ones(max(size(vert_link1)),1)];
    T1=[R(:,:,i) p(i,:)'
        zeros(1,3)      1];
    aux_vert1=(T1*aux_vert1')';
    vert_link_1_move=aux_vert1(:,1:3);
    
    cdata(:,:,1) = [1 0 1 1 1 0 0 0 1 1 1 0 0 0];
    cdata(:,:,2) = [1 0 0 0 0 1 1 1 0 0 0 0 0 0];
    cdata(:,:,3) = [1 0 1 1 1 1 1 1 1 1 1 1 1 1];

%     aux_vert2=[vert_link2,ones(max(size(vert_link2)),1)];
%     T2=[eye(3)    p(i,:)'
%         zeros(1,3)      1];
%     aux_vert2=(T2*aux_vert2')';
%     vert_link_2_move=aux_vert2(:,1:3);
%     
%     
%     aux_vert3=[vert_link3,ones(max(size(vert_link3)),1)];
%     T3=[eye(3)    [pr(i,1),pr(i,2),pr(i,3)]'
%         zeros(1,3)      1];
%     aux_vert3=(T3*aux_vert3')';
%     vert_link_3_move=aux_vert3(:,1:3);

%     quadrotor
    O1=patch('Vertices',vert_link_1_move,'Faces',face_links1,'faceColor',[0/255 255/255 255/255]);
    set(O1,'FaceColor','flat','CData',cdata,'EdgeColor','none');
    hold on
    %actual position
    plot3(p(i,1),p(i,2),p(i,3),'.b','LineWidth',4);
    hold on
    %reference 
    plot3(pr(i,1),pr(i,2),pr(i,3),'.r','LineWidth',3);
    hold on
    %r3 arrow
    arrow_r3_x=linspace(p(i,1),(p(i,1)+0.5.*r3(1,i)'),100);
    arrow_r3_y=linspace(p(i,2),(p(i,2)+0.5.*r3(2,i)'),100);
    arrow_r3_z=linspace(p(i,3),(p(i,3)+0.5.*r3(3,i)'),100);
    plot3(arrow_r3_x,arrow_r3_y,arrow_r3_z,'-','Color',[1 0.5 0.1],'LineWidth',0.1);
    hold on
    %arrow head
    plot3(p(i,1)+0.5.*r3(1,i)',p(i,2)+0.5.*r3(2,i)',p(i,3)+0.5.*r3(3,i),'^','MarkerEdgeColor',[1 0.5 0.1],'MarkerSize',2);
    hold on
    %r3d
    arrow_r3d_x=linspace(p(i,1),(p(i,1)+0.5.*r3d(1,i)'),100);
    arrow_r3d_y=linspace(p(i,2),(p(i,2)+0.5.*r3d(2,i)'),100);
    arrow_r3d_z=linspace(p(i,3),(p(i,3)+0.5.*r3d(3,i)'),100);
    plot3(arrow_r3d_x,arrow_r3d_y,arrow_r3d_z,'-','Color',[0.9 0.5 1],'LineWidth',0.1);
    hold on
    %arrow head
    plot3(p(i,1)+0.5.*r3d(1,i)',p(i,2)+0.5.*r3d(2,i)',p(i,3)+0.5.*r3d(3,i),'^','MarkerEdgeColor',[0.9 0.5 1],'MarkerSize',2);
    hold on
    axis equal
    grid on
%     O2=patch('Vertices',vert_link_2_move,'Faces',face_links2,'faceColor',[255/255 255/255 255/255]);
%     
%     O3=patch('Vertices',vert_link_3_move,'Faces',face_links3,'faceColor',[0/255 0/255 255/255]);
%     set(O3,'EdgeColor','none');
    
%     F(i)=getframe(hh);%snapshot of the graph
    
    pause(0.01);
    
    if i==length(t)
    else
        delete(O1);
    end

%     if mod(i,9)==0
%         delete(O3);
%     end
%     
%     if mod(i,3)==0
%         
%         delete(O2);
%     end
end

% myVideo=VideoWriter('myfile.avi');
% myVideo.FrameRate=100;
% myVideo.Quality=50;
% open(myVideo)
% writeVideo(myVideo,F)
% close(myVideo)


end

