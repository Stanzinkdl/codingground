function[bestsol,fval]=cuckoo_search(Ngen)
%Here Ngen is the max no of evaluations
if nargin<1,Ngen=1500; end
d=2;
n=25;
pa=0.25;
nest=randn(n,d)
fbest=ones(n,1)*10^(100)
kbest=1;
for j=1:Ngen,
kbest=get_best_nest(fbest);
k=choose_a_nest(kbest);
bestnest=nest(kbest,:)
s=get_a_cuckoo(nets(k,:),bestnest);
fnew=fobj(s);
if fnew<=fbest(k),
fbest(k)=fnew;
nest(k,:)=s;
end
if rand<pa,
k=get_max_nest(fbest);
s=emptyit(nest(k,:));
nest(k,:)=s;
fbest(k)=fobj(s);
end
end
[fval,I]=min(fbest)
bestsol=nest(I,:)
function k=Choose_a_nest(n,kbest)
k=floor(rand*n)+1;
if k==kbest
k=mod(k+1,n)+1;
end
function s=get_a_cuckoo(s,star)
stepsize=0.05;
s=star+stepsize*randn(size(s));
function k=get_max_nest(fbest)
[fmax,k]=max(fbest);
function k=get_best_nest(fbest)
[fmin,k]=min(fbest);
function s=empty it(s)
s=s+0.05*randn(size(s));
function z=fobj(u)
z=(1-u(1)^2+100*(u(2)-u(1)^)^2;