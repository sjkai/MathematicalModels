function [nextroad] = chooseRoad(cari,currentRoad,RoadMap,Car,Roaddistance, RoadCarNum)
%%%����·��ѡ��·�ķ���
% nextroad:ѡ�����һ��·�ı��
% cari���������
% currentRoad: ��ǰ���ڵ�·�ı��
% RoadMap: ·�Ŀɴ��Ծ���
% Car����ǰ��������״̬
% Roaddistance��ÿ��·�ĳ���
% RoadCarNum: ��ǰÿ��·���ж��ٳ�
    k1 = 1;%��������
    k2 = 1;
    nextroad = 0;
    min = intmax();
    roadNum = length(RoadMap);
    % disp(strcat('currentroadNum', num2str(currentRoad)));
    myNeighbor = zeros(roadNum);
    myNeighborNum = 0;
    for i = 1 : roadNum
        if(RoadMap(i, currentRoad) == 0) %%��·��ͨ�����
            continue;
        end
        myNeighborNum = myNeighborNum + 1;
        myNeighbor(myNeighborNum) = i;
        % disp(strcat('roadNum', num2str(i)));
        %{ ��������ѡ��
        myvalue = 0;
        for j = 1 : (cari - 1)
            if(Car{j}.state == 1 && Car{j}.road == i && Car{j}.distance == 1)
            % �ж�������·�Ƿ���Ҫ��
                myvalue = intmax() - 100000;
                break;
            end
        end
        %%����ÿ��·��ָ��
        myvalue = myvalue + k1 * Roaddistance(i) + k2 * RoadCarNum(i);
        if(myvalue < min)
            min = myvalue;
            nextroad = i;
        end
        %}
        % disp(i);
        % disp(myvalue);
    end
    %%���ѡ��
    nextroad = myNeighbor(ceil(rand() * (myNeighborNum)));