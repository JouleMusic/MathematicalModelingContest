%ͳ�����������ڵ���6�����ն�
clc
clear all

%������Ҫ�޸��ļ�·�����ļ���
mobile_located = textread('D:\Question4\result_case026.txt');

%�ɱ���λ���ն���
located_num = mobile_located(1, 1)

%���пɱ���λ���ն˱�ż�������������
num = mobile_located(4:located_num + 3, 2);

%������ͳ�����������ڵ���6�����ն�
counter = 0;
for i = 1:located_num
    if num(i) >= 6
        counter = counter + 1;
    end
end

%�����д���ļ�
file_result = fopen('D:\Question4\counter_case030.txt', 'a');
fprintf(file_result, '%d\n', counter);
fclose(file_result);