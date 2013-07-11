function y = FailPass(Student, i)
    if ~isempty(Student.Marksheet(i).det.Practical2)
        if ~isempty(Student.Marksheet(i).det.Theory1 ) && ~isempty(Student.Marksheet(i).det.Practical1)
                if Student.Marksheet(i).det.Practical2 == 0
                    y = Student.Marksheet(i).det.Theory1 + ...
                        Student.Marksheet(i).det.Practical1;
                else
                    y = Student.Marksheet(i).det.Practical2;
                end
        else
            y = 0;
        end
    else
       if ~isempty(Student.Marksheet(i).det.Theory1 ) && ~isempty(Student.Marksheet(i).det.Practical1)
                    y = Student.Marksheet(i).det.Theory1 + ...
                        Student.Marksheet(i).det.Practical1;
       else
                    y = 0;
       end
    end
end