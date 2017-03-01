%���ݲ���������������ж��㷨��ȷ��
clc;
clear all

%������Ҫ�޸��ļ���
input_file = textread('D:\Question2\sample_case001_input.txt');
target = textread('D:\Question2\sample_case001_ans.txt');
result = textread('D:\Question2\sample_output_case_001.txt');

%�ն���
mobile_num = input_file(2,1);

%�ն˵���ʵ����
x_target = target(:, 1);
y_target = target(:, 2);
z_target = target(:, 3);

%��õ�����
x_result = result(:, 1);
y_result = result(:, 2);
z_result = result(:, 3);

D = zeros(mobile_num,1);
d = zeros(mobile_num,1);
sum = 0;
counter_5 = 0;
counter_10 = 0;
counter_20 = 0;
counter_40 = 0;
counter_other = 0;

%ͳ�����ֲ�
for i = 1:mobile_num
    D(i,1) = (x_target(i,1) - x_result(i,1))^2 + (y_target(i,1) - y_result(i,1))^2 + (z_target(i,1) - z_result(i,1))^2;
    d(i,1) = sqrt(D(i,1));
    test = d(i,1);
    
    if test <= 5
        counter_5 = counter_5 + 1;
    elseif test > 5 && test <=10
        counter_10 = counter_10 + 1;
    elseif test > 10 && test <= 20
        counter_20 = counter_20 + 1;
    elseif test > 20 && test <= 40
        counter_40 = counter_40 + 1;
    else
        counter_other = counter_other + 1;
    end
    
    sum = sum + d(i,1);
end
d = sort(d);

%����ƽ��ֵ
aver = sum / mobile_num

s = 0;
for j = 1:mobile_num
    s = s + (d(j,1) - aver)^2;
end

%����
err = s / mobile_num

data = [counter_5, counter_10, counter_20, counter_40, counter_other]
percent = data / mobile_num * 100

%���Ʊ�ͼ
pie(percent)