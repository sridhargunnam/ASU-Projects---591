clear ;
v1=[0,0];v2=[50,150];v3=[200,100];
sp=[1,1]; % starting point of traversal
%Exy=(x-X)dY - (y-Y)dX;
%initial edge function value
dY12=v2(2)-v1(2);dX12=v2(1)-v1(1);
Exyi12=(sp(1)-v2(1))*dY12-(sp(2)-v2(2))*dX12;
dY23=v3(2)-v2(2);dX23=v3(1)-v2(1);
Exyi23=(sp(1)-v3(1))*dY23-(sp(2)-v3(2))*dX23;
dY31=v1(2)-v3(2);dX31=v1(1)-v3(1);
Exyi31=(sp(1)-v1(1))*dY31-(sp(2)-v1(2))*dX31;
%Ei ( x + l , y) = Ei(x, y) + dYi,
%Ei ( x - 1 , y) = Ei(x, y) - dYi,
%Ei (x, y + l ) = Ei(x, y) - dXi,
%Ei (x, y - l ) = Ei(x, y) + dXi,
n=200; 
im12=zeros(n,n); im12(1,1)=Exyi12;
im23=zeros(n,n); im23(1,1)=Exyi23;
im31=zeros(n,n); im31(1,1)=Exyi31;
imactual=zeros(n,n);
%i=1;j=1;
count=0;
for i=1:n
    for j=1:n
    im12(i,j+1)=im12(i,j) + dY12;
	im23(i,j+1)=im23(i,j) + dY23;
	im31(i,j+1)=im31(i,j) + dY31;
	%i=i+1; 
    count=count+1;
    end
    j=1;
    im12(i+1,j)=im12(i,j) - dX12;
	im23(i+1,j)=im23(i,j) - dX23 ;
	im31(i+1,j)=im31(i,j) - dX31 ;
	%j=j+1;
	end

for y=1:n
		for x=1:n
            if(im12(x,y)>=0 && im23(x,y)>=0 && im31(x,y)>=0)
            imactual(x,y)=1;
            else
            imactual(x,y)=0;
            end
		end
end

imud=flipud(imactual);
imshow(imud);		

