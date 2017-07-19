function [nextroad] = chooseRoad(cari,currentRoad,RoadMap,Car,Roaddistance, RoadCarNum)
%%%交叉路口选择路的方向
% nextroad:选择的下一条路的标号
% cari：车的序号
% currentRoad: 当前所在的路的标号
% RoadMap: 路的可达性矩阵
% Car：当前各辆车的状态
% Roaddistance：每条路的长度
% RoadCarNum: 当前每条路上有多少车
    k1 = 1;%两个参数
    k2 = 1;
    nextroad = 0;
    min = intmax();
    roadNum = length(RoadMap);
    % disp(strcat('currentroadNum', num2str(currentRoad)));
    myNeighbor = zeros(roadNum);
    myNeighborNum = 0;
    for i = 1 : roadNum
        if(RoadMap(i, currentRoad) == 0) %%道路不通的情况
            continue;
        end
        myNeighborNum = myNeighborNum + 1;
        myNeighbor(myNeighborNum) = i;
        % disp(strcat('roadNum', num2str(i)));
        %{ 根据最优选择
        myvalue = 0;
        for j = 1 : (cari - 1)
            if(Car{j}.state == 1 && Car{j}.road == i && Car{j}.distance == 1)
            % 判断走这条路是否需要等
                myvalue = intmax() - 100000;
                break;
            end
        end
        %%计算每条路的指标
        myvalue = myvalue + k1 * Roaddistance(i) + k2 * RoadCarNum(i);
        if(myvalue < min)
            min = myvalue;
            nextroad = i;
        end
        %}
        % disp(i);
        % disp(myvalue);
    end
    %%随机选择
    nextroad = myNeighbor(ceil(rand() * (myNeighborNum)));