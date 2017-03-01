%������Լ������
function [g,h] = nonlcon_fuc(input_file, base_num, mobile_num, row, x);

    %baseΪ30����վ���꣬timeΪ�ն˵���վ��TOA
    base = input_file(4 : base_num + 3, 1:3);
    time = input_file(base_num + 4 : base_num + mobile_num + 3, 1:base_num);

    % ���ߵ��źŵĴ����ٶ�
    SPD = 3e8;

    %��վ��X���������
    axis_x = base(:,1);
    %��վ��Y���������
    axis_y = base(:,2);
    %��վ��Z���������
    axis_z = base(:,3);

    %������󣬵�i��Ϊ��i���ն˵�������վ�ľ���
    distance = SPD * time; 

    %��row���ն˵���վ����
    radia = distance(row,:);

    %���հ뾶����С��������
    radia_n = sort(radia);

    %�����ĸ���վ��ά����
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

    %�뾶��С��ĵĻ�վ����
    x_min1 = axis_x_n(1,1);
    y_min1 = axis_y_n(1,1);
    z_min1 = axis_z_n(1,1);

    %�뾶��С��ĵĻ�վ����
    x_min2 = axis_x_n(2,1);
    y_min2 = axis_y_n(2,1);
    z_min2 = axis_z_n(2,1);

    %��С�������뾶
    r_min1 = radia_n(1,1);
    r_min2 = radia_n(1,2);

    i = 0;
    j = 0;
    k = 0;
    
    %�ҳ��뾶��ӽ���������
    for num = 1:base_num - 2
        if ((radia_n(1, num + 1) - radia_n(1, num)) < 20)  && ((radia_n(1, num + 2) - radia_n(1, num + 1)) < 20)
                i = num;
                j = num + 1;
                k = num + 2;
                break;
        else
            i = 2;
            j = 3;
            k = 4;
        end
    end
    
    R = [radia_n(1,i), radia_n(1,j), radia_n(1,k)];
    X = [axis_x_n(i,1), axis_x_n(j,1) , axis_x_n(k,1)];
    Y = [axis_y_n(i,1), axis_y_n(j,1) , axis_y_n(k,1)];
    Z = [axis_z_n(i,1), axis_z_n(j,1) , axis_z_n(k,1)];

    %g��hΪ�����Թ滮�еķ�����Լ������
    g=[(x(3) - x_min1)^2 + (x(4) - y_min1)^2 + (x(5) - z_min1)^2 - r_min1^2
       (x(3) - x_min2)^2 + (x(4) - y_min2)^2 + (x(5) - z_min2)^2 - r_min2^2
       - R(1)^2 + x(1) * ((x(3) - X(1))^2 + (x(4) - Y(1))^2) + x(2) * (x(5) - Z(1))^2
       - R(2)^2 + x(1) * ((x(3) - X(2))^2 + (x(4) - Y(2))^2) + x(2) * (x(5) - Z(2))^2
       - R(3)^2 + x(1) * ((x(3) - X(3))^2 + (x(4) - Y(3))^2) + x(2) * (x(5) - Z(3))^2
         ];
     
     h=[];
end