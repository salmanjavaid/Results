close all;clear all; clc;

choice = 4;


if choice == 1
    load 'ChemistryRawData.mat'
    t = ChemistryRawData;
elseif choice == 2
    load 'MathematicsRawData.mat'
    t = MathematicsRawData;
elseif choice == 3
    load 'PhysicsRawData.mat'
    t = PhysicsRawData;
elseif choice == 4
    load 'EnglishRawData.mat'
    t = EnglishRawData;
end
            
q = cell(83805,6);
row = 1;
for i = 1:1: 169856
    if choice == 1
            if ~isempty(t{i})
                    str = t{i};
                    ind=find(ismember(str,','));

                    q{row,1} = str(2:ind(1) - 2);
                    if ~isempty(q{row,1})
                        index = 2;
                        str = str(ind+1:end);
                        r=regexp(str,'\s','split');
                        if isempty(find(ismember(r,'ABSENT')))
                            if i == 134667
                                lm = 1;
                            end

                            if ~isempty(str)

                                for j = 2:2: 10     %for Chemistry and Others
                                    q{row,index} = r{j};
                                    index = index + 1;
                                end
                                row = row + 1;
                            end
                        end
                    end
            end
            
    elseif choice == 2
            str = t{i}; 
            ind=find(ismember(str,','));
            if ~isempty(str) && ~isempty(str(2:ind(1) - 2))
                    q{row,1} = str(2:ind(1) - 2);
                    index = 2;
                    str = str(ind+1:end);
                    r=regexp(str,'\s','split');
                    if isempty(find(ismember(r,'ABSENT')))
                       if i == 134667
                             lm = 1;
                       end
                       
                       if ~isempty(str)
                           for j = 2:2: 10     %for Chemistry and Others
                               q{row,index} = r{j};
                               index = index + 1;
                           end
                           row = row + 1;
                       end
                    end
                    
            end
            
    elseif choice == 3
            str = t{i}; 
            ind=find(ismember(str,','));
            if ~isempty(str) && ~isempty(str(2:ind(1) - 2))
                    q{row,1} = str(2:ind(1) - 2);
                    index = 2;
                    str = str(ind+1:end);
                    r=regexp(str,'\s','split');
                    if isempty(find(ismember(r,'ABSENT')))
                       if i == 130711
                             lm = 1;
                       end
                       
                       if ~isempty(str)
                           for j = 2:2: 10     %for Chemistry and Others
                               q{row,index} = r{j};
                               index = index + 1;
                           end
                           row = row + 1;
                       end
                    end
            end
    elseif choice == 4
            str = t{i}; 
            ind=find(ismember(str,','));
            if ~isempty(str) && ~isempty(str(2:ind(1) - 2))
                    q{row,1} = str(2:ind(1) - 2);
                    index = 2;
                    str = str(ind+1:end);
                    r=regexp(str,'\s','split');
                    if isempty(find(ismember(r,'ABSENT')))
                       if i == 130711
                             lm = 1;
                       end
                       
                       if ~isempty(str)
                           for j = 2:2: 10     %for Chemistry and Others
                               q{row,index} = r{j};
                               index = index + 1;
                           end
                           row = row + 1;
                       end
                    end
            end
    end  
end

clear t;
clear ChemistryRawData;
ind = 1;
res = zeros(row-1, 1);

for start = 1: row-1
    a = str2num(q{start,5});
    if ~isempty(a)
        res(ind) = a;
        ind = ind + 1;
    end
end





% celltocsv('J:\\Matlab Test - 5.csv', q);