function[nextroad,nextdistance,nextstate]=nextdir_red(cari,RoadMap,Car,Roaddistance,Outroad, RoadCarNum)
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
    nextstate = 1;
    nextroad = car.road;
    nextdistance = car.distance;
    if car.distance >= Roaddistance(Car{cari}.road) &&ismember(car.road,Outroad)
        return;
    end
    nextdistance = nextdistance + 1;
    if(Roaddistance(nextroad) < nextdistance)
        nextroad = chooseRoad(cari,nextroad,RoadMap,Car,Roaddistance,RoadCarNum); %%%����·��ѡ��·�ķ���
        nextdistance = 1;
    end
    for i = 1 : (cari - 1)
        if(Car{i}.state == 1 && Car{i}.road == nextroad &&Car{i}.distance == nextdistance)
            %%%% ���������ߣ�
            nextroad = car.road;
            nextdistance = car.distance;
        end
    end