function[nextroad,nextdistance,nextstate]=nextdir(cari,RoadMap,Car,Roaddistance,Outroad, RoadCarNum)
% ����nextdir ����cari ��������һ��֮���״̬
% nextroad: 1s �����ڵ�·
% nextdistance��1s ����·�Ͼ�·��ڵ��߼�����
% nextstate: 1s �󣬸ó��Ƿ���������
% cari���������
% RoadMap: ·�Ŀɴ��Ծ���
% Car����ǰ��������״̬
% Roaddistance��ÿ��·�ĳ���
% Outroad�����п��ܳ�ȥ��·
% RoadCarNum: ��ǰÿ��·���ж��ٳ�
    car = Car{cari}; %��ǰ���ڿ��ǵĳ�
    nextroad = car.road;
    nextdistance = car.distance;
    if car.distance >= Roaddistance(Car{cari}.road) && ismember(car.road,Outroad)
        nextstate = 0;
        return;
    else
        nextstate = 1;
    end
    nextdistance = nextdistance + 1;
    if(Roaddistance(nextroad) < nextdistance)
        %����·��ѡ��·�ķ���
        nextroad = chooseRoad(cari,nextroad,RoadMap,Car,Roaddistance,RoadCarNum); 
        nextdistance = 1;
        % disp(strcat('car', num2str(cari)));
        % disp(strcat('change road to', num2str(nextroad)));
    end
    for i = 1 : (cari - 1)
        if(Car{i}.state == 1 && Car{i}.road == nextroad && Car{i}.distance == nextdistance)%%%% ���������ߣ�
            nextroad = car.road;
            nextdistance = car.distance;
        end
    end