function [allCells,allResults] = removeIrrelevant(allControl_, allTreated_, indecesToKeep, class, value)

if strcmp(class,'double')
    sizeControl = size(allControl_);
sizeTreated = size(allTreated_);
    % Create result
treated = {'t'};
for i=2:sizeTreated(1)
    treated = [treated;'t'];
end;
control = {'c'};
for i=2:sizeControl(1)
    control = [control;'c'];
end;
allCells_ = [allControl_;allTreated_];
allResults = [control;treated];

    %display('double');
    allCells = [allCells_(:,indecesToKeep(1))];
    for i = 2:length(indecesToKeep)
    allCells = [allCells,allCells_(:,indecesToKeep(i))];
    end;
    
elseif strcmp(class,'singleVector')
    allResults = 0;
    allCells = [allTreated_(:,indecesToKeep(1))];
    for i = 2:length(indecesToKeep)
    allCells = [allCells,allTreated_(:,indecesToKeep(i))];
    end;
    
elseif strcmp(class,'cell')
    %display('cell');
    allCells = [allControl_(indecesToKeep(1))];
    for i = 2:length(indecesToKeep)
    allCells = [allCells;allControl_(indecesToKeep(i))];
    end;
    
 elseif strcmp(class,'value')
    sizeTreated = size(allTreated_);
        % Create result
    treated = {num2str(value)};
    for i=2:sizeTreated(1)
        treated = [treated;num2str(value)];
    end;
    allResults = [treated];
    allCells_ = [allTreated_];
    %allResults = [control;treated];
    %display('double');
    allCells = [allCells_(:,indecesToKeep(1))];
    for i = 2:length(indecesToKeep)
    allCells = [allCells,allCells_(:,indecesToKeep(i))];
    end;
    
 elseif strcmp(class,'numericvalue')
    sizeTreated = size(allTreated_);
        % Create result
    treated = value;
    for i=2:sizeTreated(1)
        treated = [treated;value];
    end;
    allResults = [treated];
    allCells_ = [allTreated_];
    %allResults = [control;treated];
    %display('double');
    allCells = [allCells_(:,indecesToKeep(1))];
    for i = 2:length(indecesToKeep)
    allCells = [allCells,allCells_(:,indecesToKeep(i))];
    end;

end;
    