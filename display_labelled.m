function [fig]= display_labelled(fig, LayerCentroid)

for numLayer=1:size(LayerCentroid,1)
    for numCentroidLayer=1:size(LayerCentroid{numLayer,1})
        text(LayerCentroid{numLayer,1}(numCentroidLayer,2), LayerCentroid{numLayer,1}(numCentroidLayer, 3),sprintf('%d',numCentroidLayer),'HorizontalAlignment','center','VerticalAlignment','middle','Color','white','FontSize',15);        
    end
end

% for numLayer=1:size(LayerCentroid,1)
%     for numCentroidLayer=1:size(LayerCentroid{numLayer,1})
%         LayerCentroid{numLayer, 1} = horzcat(LayerCentroid{numLayer,1}(numCentroidLayer,:), numCentroidLayer);
%     end
% end

end

