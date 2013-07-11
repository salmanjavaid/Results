function Parse()

clear all; close all; clc;

fid = fopen('Final - 2.csv');

load subjects

tline = fgetl(fid);
count = 1;
X = zeros(2, 245);

Subj = struct ('Name', [], 'det', struct());
details = struct('Theory1', [], 'Practical1', [], 'Theory2', [], 'Practical2', [], 'Total', []);

Subj.det = details;
Student  = struct('Marksheet', struct());
Student.Marksheet = repmat(Subj, 9, 1);
Student = repmat(Student, 10000, 1);
count = 1; 
i = 1;
while ischar(tline)
    
   
    
    for i = 1: 10000
        
        if count == 4 && i == 1576
            jsdu = 3;
        end
            tline = fgetl(fid);
            if tline ~= -1
                r = regexp(tline,'\"','split');
                r = r(2:2:end);
                if length(r) > 1
                        for j = 1: length(r)
                            if j < length(r)
                                u = regexp(r{j},'\,','split');

                                Student(i).Marksheet(j).Name = u(1);
                                Student(i).Marksheet(j).det.Theory1 = Replace(u(2));
                                Student(i).Marksheet(j).det.Practical1 = Replace(u(3));
                                Student(i).Marksheet(j).det.Theory2 = Replace(u(4));
                                Student(i).Marksheet(j).det.Practical2 = Replace(u(5));
                                Student(i).Marksheet(j).det.Total = Replace(u(6));
                            else
                                u = regexp(r{j},'\,','split');
                                if length(u) > 7
                                    Student(i).Marksheet(j).det.Theory1 = u(4);
                                    Student(i).Marksheet(j).det.Practical1 = u(5);
                                    Student(i).Marksheet(j).det.Theory2 = u(6);
                                    Student(i).Marksheet(j).det.Practical2 = u(7);
                                    Student(i).Marksheet(j).det.Total = u(8);
                                else
                                    Student(i).Marksheet(j).det.Theory1 = u(3);
                                    Student(i).Marksheet(j).det.Practical1 = u(4);
                                    Student(i).Marksheet(j).det.Theory2 = u(5);
                                    Student(i).Marksheet(j).det.Practical2 = u(6);
                                    Student(i).Marksheet(j).det.Total = u(7);
                                end
                            end

                        end
                end
            end

            
    end
    
    save(strcat(strcat('J:\Work\Learning\Results\Structs\', strcat('student', strcat('_', num2str(count))), '.mat')), 'Student');
    count = count + 1;
end


fclose(fid);


end


function y = Replace(str)

    if strcmp(strtrim(str), '---')
        y = 0;
    else
        y = str2num(str{:});
    end
    
end