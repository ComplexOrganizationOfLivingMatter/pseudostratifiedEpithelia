function [LayerCentroid] = addNewCentroid( f, LayerCentroid, numFrame )
%ADDNEWCENTROID This function is used to manually add a centroid and put in which layer it belongs

newLayer1=false;
[x,y]=getpts(f);

layer=input('Write to the layer belonging to this centroid: ');

if layer > size(LayerCentroid, 1) %If there is no layer created
    LayerCentroid{layer, 1} = horzcat(numFrame, [x,y]);
    %LayerPixel{layer, 1} = horzcat(numFrame, [round(x),round(y)]);
    newLayer1=true;
    
else %If there is layer created
    LayerCentroid{layer,1}= vertcat(LayerCentroid{layer,1}, horzcat(numFrame,[x,y]));
    %LayerPixel{layer,1}= vertcat(LayerPixel{layer,1}, horzcat(numFrame,[round(x),round(y)]));
end

end

