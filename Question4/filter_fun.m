%�����ɶ�λ�ն������޸�Ϊxnan ynan znan
clc;
clear all;

%������Ҫ�޸��ļ�·�����ļ���
mobile_location = textread('D:\Question4\location_output_case_026.txt');
mobile_located = textread('D:\Question4\result_case026.txt');

%�ɱ���λ���ն���
located_num = mobile_located(1, 1);

%�ն���ά������������������
[row, col] = size(mobile_location);

%ת��Ϊcell����
cell_mobile_location = cell(row, col);
for i = 1:row
    for j = 1:col
        cell_mobile_location{i, j} = mobile_location(i, j);
    end
end

%matrix��һ��Ϊ�ɱ���λ���ն�����ţ��ڶ���Ϊ���ն˵�������
matrix = mobile_located(4:located_num + 3, :);

cursor = 1;
for i = 1:row
    if cursor <= located_num
       num = matrix(cursor,1);
       if i == num
            cursor = cursor + 1;
       else
            cell_mobile_location{i, 1} = 'xnan';
            cell_mobile_location{i, 2} = 'ynan';
            cell_mobile_location{i, 3} = 'znan';
       end 
    else
        if i <= row
           for j = i:row
               cell_mobile_location{j, 1} = 'xnan';
               cell_mobile_location{j, 2} = 'ynan';
               cell_mobile_location{j, 3} = 'znan';
               
               %�����д���ļ���
               file_result = fopen('D:\Question4\output_case_026.txt', 'a');
               if strcmp(cell_mobile_location{i, 1}, 'xnan')
                    fprintf(file_result, '%-7s %-7s %-7s\n', cell_mobile_location{i, 1}, cell_mobile_location{i, 2}, cell_mobile_location{i, 3});
               else
                    fprintf(file_result, '%-7.2f %-7.2f %-7.2f\n', cell_mobile_location{i, 1}, cell_mobile_location{i, 2}, cell_mobile_location{i, 3});
               end
               fclose(file_result);
           end
        end
        break;
    end
    
    %�����д���ļ���
    file_result = fopen('D:\Question4\output_case_026.txt', 'a');
    if strcmp(cell_mobile_location{i, 1}, 'xnan')
        fprintf(file_result, '%-7s %-7s %-7s\n', cell_mobile_location{i, 1}, cell_mobile_location{i, 2}, cell_mobile_location{i, 3});
    else
        fprintf(file_result, '%-7.2f %-7.2f %-7.2f\n', cell_mobile_location{i, 1}, cell_mobile_location{i, 2}, cell_mobile_location{i, 3});
    end
    fclose(file_result);
end

