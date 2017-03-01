%�жϳ��ɱ���λ���ն�
clear all;
clc;

%������Ҫ�޸��ļ�·�����ļ���
input_file = textread('D:\Question4\case026_input.txt');
mobile_location = textread('D:\Question4\location_output_case_026.txt');

%base_numΪ��վ����mobile_numΪ�ն���
base_num = input_file(1,1);
mobile_num = input_file(2,1);

%��վ�������
base_location = input_file(4:base_num + 3, 1:3);

x_base = base_location(:,1);
y_base = base_location(:,2);
z_base = base_location(:,3);

x_mobile = mobile_location(:,1);
y_mobile = mobile_location(:,2);
z_mobile = mobile_location(:,3);

%�ɱ���λ���ն���
able = 0;
%���ɱ���λ���ն���
unable = 0;
%����ɱ���λ��������ն˶�Ӧ��positionΪ1������Ϊ0
position = zeros(mobile_num, 1);
%ÿ���ɱ���λ�ն˵���վ֮�������������
num = zeros(mobile_num, 1);

for i = 1:mobile_num
    %�ն����վ֮��ľ���С��200�׵ĸ���
    counter = 0;
    for j = 1:base_num
        D= (x_mobile(i,1) - x_base(j,1))^2 + (y_mobile(i,1) - y_base(j,1))^2 + (z_mobile(i,1) - z_base(j,1))^2;
        %�ն������վ֮��ľ���
        d= sqrt(D);
        if d <= 200
            counter = counter + 1;
        end
    end
   
    if counter >= 4
       able = able + 1;
       position(i) = i;
       num(i) = counter;

    else
        unable = unable + 1;
        position(i) = 0;
    end
end

%���п��Ա���λ�ն˵���վ֮���������
total_num = sum(num);
%���Ӷ���
lambd = total_num / mobile_num;

%�����д���ļ���
file_result = fopen('D:\Question4\result_case026.txt', 'a');
fprintf(file_result, '%d   %d\n', able, unable);
fprintf(file_result, '%d\n', total_num);
fprintf(file_result, '%.2f\n',lambd);

for k = 1:mobile_num
    if position(k) > 0
        file_result = fopen('D:\Question4\result_case026.txt', 'a');
        fprintf(file_result, '%d    %d\n', k, num(k));
        fclose(file_result);
    end
end