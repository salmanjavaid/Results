

clear all; close all; clc;


X = zeros(20000, 9);
count = 1;

for j = 1: 18
    
            load (strcat('student', strcat('_', num2str(j))));
            for i = 1: 10000
                
                if i == 1576
                    pi = 34;
                end
                
                if ~isempty(Student(i).Marksheet(9).det.Practical2)

                                if strcmp(strtrim(Student(i).Marksheet(5).Name), 'MATHEMATICS [COMPULSORY]')...
                                    && strcmp(strtrim(Student(i).Marksheet(6).Name), 'PHYSICS')...
                                    && strcmp(strtrim(Student(i).Marksheet(7).Name), 'CHEMISTRY')...
                                    && (strcmp(strtrim(Student(i).Marksheet(8).Name),   'BIOLOGY') || strcmp(strtrim(Student(i).Marksheet(8).Name),   'COMPUTER SCIENCE'))

                                               
%                                                     X(count,1) = str2num(strtrim(Student(i).Marksheet(1).det.Practical2{:}));
%                                                     X(count,2) = str2num(strtrim(Student(i).Marksheet(2).det.Practical2{:}));
%                                                     X(count,3) = str2num(strtrim(Student(i).Marksheet(3).det.Practical2{:}));
%                                                     X(count,4) = str2num(strtrim(Student(i).Marksheet(4).det.Practical2{:}));
%                                                     X(count,5) = str2num(strtrim(Student(i).Marksheet(5).det.Practical2{:}));
%                                                     X(count,6) = str2num(strtrim(Student(i).Marksheet(6).det.Practical2{:}));
%                                                     X(count,7) = str2num(strtrim(Student(i).Marksheet(7).det.Practical2{:}));
%                                                     
                                                    X(count,1) = FailPass(Student(i), 1);
                                                    X(count,2) = FailPass(Student(i), 2);
                                                    X(count,3) = FailPass(Student(i), 3);
                                                    X(count,4) = FailPass(Student(i), 4);
                                                    X(count,5) = FailPass(Student(i), 5);
                                                    X(count,6) = FailPass(Student(i), 6);
                                                    X(count,7) = FailPass(Student(i), 7);

                                                    if strcmp(strtrim(Student(i).Marksheet(8).Name),   'BIOLOGY')
                                                        X(count,8) = FailPass(Student(i), 8);
                                                    else
                                                        X(count,9) = FailPass(Student(i), 8);
                                                    end
                                                    count = count + 1;
                                    end
                        end 
            end
    end
    



