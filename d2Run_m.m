nn=14;%chose nn to be anything between 3 to 14. If you have a good memory (more than 16GB) you may be able to push for higher nn.
proj=1;%if proj=1 we truncate to qubit, if =2, we project to qutrit subspace
if proj==2
    M_1alpha=@(tau,alpha) exp(-abs(alpha)^2/2)*...
        [1, -1i*alpha*sqrt(tau/2), -tau*abs(alpha)^2/(sqrt(2));...
        1i*alpha'*sqrt(tau/2),  1+tau*(abs(alpha)^2/2-1), ...
        1i*sqrt(tau)*alpha/2*(tau*(abs(alpha)^2-4)+2);...
        -tau*abs(alpha)^2/(sqrt(2)), -1i*sqrt(tau)*alpha'/2*(tau*(abs(alpha)^2-4)+2),...
        1/8*( tau^2*abs(alpha)^4+8*tau*(1-tau)*abs(alpha)^2+8*tau*(tau-2)+8 )];
    M_2alpha=@(tau,alpha) eye(3) - M_1alpha(tau,alpha);
elseif proj==1
    M_1alpha=@(tau,alpha) exp(-abs(alpha)^2/2)*...
        [1, -1i*alpha*sqrt(tau/2);...
        1i*alpha'*sqrt(tau/2),  1+tau*(abs(alpha)^2/2-1)];
    M_2alpha=@(tau,alpha) eye(2) - M_1alpha(tau,alpha);
end
%PARAMETERS FOR MEASUREMENTS
n=nn%defines the inverse of loss (how many become compatible)
tau=1/(n-1);%TRANSMISSITIVITY
%tau_min=tau-1/n
angle=2*pi/n;%angle between any two successive measurements
radius=.015%distance from origin (r in the paper)
alpha=zeros(1,n);
for in=1:n
    alpha(1,in)=radius*exp(1i*(in-1)*angle);
end
%--------------------------
clear Max
for in=1:n
    Max(:,:,1,in)=M_1alpha(tau,alpha(1,in));
    Max(:,:,2,in)=M_2alpha(tau,alpha(1,in));
    Max(:,:,1,in)+Max(:,:,2,in);
end
[are_JM_POVMs,Glam] = JMPOVMs(Max)
% if are_JM_POVMs==0
%     fname=['n',num2str(n),'proj=p',num2str(proj),'tauplus',num2str(tau-1/(n+1)),...
%         'tau',num2str(tau),'radius',num2str(radius)];
%     save(fname)
% end