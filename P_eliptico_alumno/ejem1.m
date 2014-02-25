function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
pdetool('snapon','on');
set(ax,'DataAspectRatio',[1 3 1]);
set(ax,'PlotBoxAspectRatio',[1 1 1]);
set(ax,'XLim',[-1 1]);
set(ax,'YLim',[-3 3]);
set(ax,'XTick',[ -3,...
 -2.5,...
 -2,...
 -1.5,...
 -1,...
 -0.5,...
 0,...
 0.5,...
 1,...
 1.5,...
 2,...
 2.5,...
 3,...
]);
set(ax,'YTick',[ -3,...
 -2.5,...
 -2,...
 -1.5,...
 -1,...
 -0.5,...
 0,...
 0.5,...
 1,...
 1.5,...
 2,...
 2.5,...
 3,...
]);
pdetool('gridon','on');

% Geometry description:
pdepoly([ -1,...
 -1,...
 0,...
 1,...
 1,...
 0,...
],...
[ 1,...
 -1,...
 -2,...
 -1,...
 1,...
 2,...
],...
 'P1');
pdecirc(0,0,0.5,'C1');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','P1-C1')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(10,...
'dir',...
1,...
'1',...
'0')
pdesetbd(9,...
'dir',...
1,...
'1',...
'0')
pdesetbd(8,...
'dir',...
1,...
'1',...
'0')
pdesetbd(7,...
'dir',...
1,...
'1',...
'0')
pdesetbd(6,...
'dir',...
1,...
'1',...
'0')
pdesetbd(5,...
'dir',...
1,...
'1',...
'0')
pdesetbd(4,...
'dir',...
1,...
'1',...
'0')
pdesetbd(3,...
'dir',...
1,...
'1',...
'0')
pdesetbd(2,...
'dir',...
1,...
'1',...
'0')
pdesetbd(1,...
'dir',...
1,...
'1',...
'0')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
pdetool('initmesh')
pdetool('refine')

% PDE coefficients:
pdeseteq(1,...
'1.0',...
'0.0',...
'10.0',...
'1.0',...
'0:10',...
'0.0',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['1.0 ';...
'0.0 ';...
'10.0';...
'1.0 '])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
str2mat('0','1000','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');
