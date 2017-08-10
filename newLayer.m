function [Layer, j, inNewLayer, onNewLayer] = newLayer( Layer, j, xQuery, yQuery, oldCentroids, numFrame, inNewLayer, onNewLayer)

%Inputs=se trabaja con esas variables
%Outputs=se crea variables vacias y se almacenan...Si es la misma que en inputs se almacenar�a

m=size(Layer{j+1,1});
index=j+1;
kNewLayer=cell(numFrame,1);

if (isempty(Layer{j+1,1})) || (m(1,1)<4)  
    w=[xQuery, yQuery];
    Layer{index,1} = vertcat(Layer{index},horzcat(numFrame, w));
    
elseif m(1,1)==4
    
    w=[xQuery, yQuery];
    xQ=Layer{index,1}(:,2);
    yQ=Layer{index,1}(:,3);
    Layer{index,1} = vertcat(Layer{index},horzcat(numFrame, w));
    [kNewLayer{numFrame}]=boundary(xQ,yQ);
    [inNewLayer{numFrame},onNewLayer{numFrame}] = inpolygon(xQ,yQ,xQ(kNewLayer{numFrame}),yQ(kNewLayer{numFrame})); %Deber�a ser con pixeles???
    
    %    figure
    %    hold on
    %    axis equal
    %    plot(x(inNewLayer{numFrame}), y(inNewLayer{numFrame})) % points inside
    %    plot(x(~inNewLayer{numFrame}),y(~inNewLayer{numFrame}),'bo') % points outside
    %    hold off
    
    
else
    
    for numNewLayer=1:size(inNewLayer{numFrame-1,1})
        
        if inNewLayer{numFrame-1,1}(numNewLayer)==0
            
            w=[xQuery, yQuery];
            Layer{index,1} = vertcat(Layer{index},horzcat(numFrame, w));
            xQ=Layer{index,1}(:,2);
            yQ=Layer{index,1}(:,3);
            [kNewLayer{numFrame}]=boundary(xQ,yQ);
            [inNewLayer{numFrame},onNewLayer{numFrame}] = inpolygon(xQ,yQ,xQ(kNewLayer{numFrame}),yQ(kNewLayer{numFrame})); %Deber�a ser con pixeles???
            
        elseif inNewLayer{numFrame-1,1}(numNewLayer)==1
            index=j+2;
            w=[xQuery, yQuery];
            Layer{index,1} = vertcat(Layer{index},horzcat(numFrame, w));
            
        end
    end
end

end

