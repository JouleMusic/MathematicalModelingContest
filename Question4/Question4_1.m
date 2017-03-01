%�����ն�λ�����꣬����ļ�����ǰ���ʲ�ͬ
function f = Question4_1;
    clear all;
    clc;

    %������Ҫ�޸��ļ�·�����ļ���
    input_file = textread('D:\Question4\case026_input.txt');
    
    base_num = input_file(1,1);
    mobile_num = input_file(2,1);

    %baseΪ��վ���꣬timeΪ�ն˵���վ�Ĵ���ʱ��
    base = input_file(4 : base_num + 3, 1:3);
    time = input_file(base_num + 4 : base_num + mobile_num + 3, 1:base_num);
    %answer = answer_file(1:1100, 1:3);

    % ��Ĵ����ٶ�
    global SPD;
    SPD = 3e8;

    %��վ��X���������
    axis_x = base(:,1);
    %��վ��Y���������
    axis_y = base(:,2);
    %��վ��Z���������
    axis_z = base(:,3);

    % figure
    % plot(axis_x, axis_y, '*');
    % hold on
    % grid

    %������󣬵�i��Ϊ��i���ն˵���N����վ�ľ���
    distance = SPD * time; 

    for row = 1:mobile_num
        %��row���ն˵���վ���루������
        radia = distance(row,:);
        radia_n = sort(radia);

        axis_x_n = ones(base_num,1);
        axis_y_n = ones(base_num,1);
        axis_z_n = ones(base_num,1);

    for i = 1:base_num
        for j = 1:base_num
            if radia_n(1,i) ==  radia(1,j)
                axis_x_n(i,1) = axis_x(j,1);
                axis_y_n(i,1) = axis_y(j,1);
                axis_z_n(i,1) = axis_z(j,1);
            end
        end
    end
    
    %x��y��z���±߽�
    x_lb = axis_x_n(1,1) - radia_n(1,1);
    y_lb = axis_y_n(1,1) - radia_n(1,1);
    z_lb = 1;
    
    %x��y��z���ϱ߽�
    x_ub = axis_x_n(1,1) + radia_n(1,1);
    y_ub = axis_y_n(1,1) + radia_n(1,1);
    z_ub = 2;
    
    %�����Թ滮
    [coordinate, value] = fmincon(@(x)obj_fun(input_file, base_num, mobile_num, row, x), [2; 3; x_ub; y_ub; z_ub], [], [], [], [], [0; 0; x_lb; y_lb; z_lb], [100; 1000; x_ub; y_ub; z_ub], @(x)nonlcon_fuc(input_file, base_num, mobile_num, row, x))
    
    %x��y��z�Ľ��
    x_result = coordinate(3,1);
    y_result = coordinate(4,1);
    z_result = coordinate(5,1);
    
    %�����д�뵽�ļ���
    file_result = fopen('D:\Question4\output_case_026.txt', 'a');
    fprintf(file_result, '%7.2f %7.2f %5.2f\n', x_result, y_result, z_result);
    fclose(file_result);
    
    end
end