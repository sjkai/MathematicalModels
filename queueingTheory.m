%��ʼ���˿�Դ
%*****************************************
%�ܷ���ʱ��Ϊ10����λ
Total_time=10;
%������󳤶�Ϊ100����λ�ĳ˿�
N=100;
%�������������
lambda=10;%��λʱ�䵽��10����λ�ĳ˿�
mu=10;%�Ż�ǰ��λʱ����10����λ�ĳ˿��뿪�������Ż�������mu=30
%ƽ������ʱ����ƽ������ʱ��
arr_mean=1/lambda;
ser_mean=1/mu;
%���ܵ�������˿�����round������������������
arr_num=round(Total_time*lambda*2);
%�˿��¼����ʼ��
events=[];
%����ָ���ֲ��������˿ʹﵽʱ����
events(1,:)=exprnd(arr_mean,1,arr_num);
%���˿͵ĵ���ʱ�̵���ʱ�������ۻ���
events(1,:)=cumsum(events(1,:));
%����ָ���ֲ��������˿ͷ���ʱ��
events(2,:)=exprnd(ser_mean,1,arr_num);
%�������˿͸�����������ʱ���ڷ���ʱ���ڵĹ˿���
len_sim=sum(events(1,:)<=Total_time);
%*****************************************
%�����1���˿͵���Ϣ
%*****************************************
%��1���˿ͽ���ϵͳ��ֱ�ӽ��ܷ�������ȴ�
events(3,1)=0;
%���뿪ʱ�̵����䵽��ʱ�������ʱ��֮��
events(4,1)=events(1,1)+events(2,1);
%��϶���ϵͳ���ɣ���ʱϵͳ�ڹ���1���˿ͣ��ʱ�־λ��1
events(5,1)=1;
%�����ϵͳ��ϵͳ�����г�Ա���Ϊ1
member=1;
%*****************************************
%�����i���˿͵���Ϣ
%*****************************************
for i=2:arr_num
%�����i���˿͵ĵ���ʱ�䳬���˷���ʱ�䣬������ѭ��
    if events(1,i)>Total_time 
        break;
    %�����i���˿͵ĵ���ʱ��δ��������ʱ�䣬��������䵽��ʱ��ϵͳ�����еĹ˿͸���
    else number=sum(events(4,member)>events(1,i));
        %���ϵͳ��������ϵͳ�ܾ���i���˿ͣ����־λ��0
        if number>=N+1
            events(5,i)=0;
        %���ϵͳΪ�գ����i���˿�ֱ�ӽ��ܷ���
        elseif number==0
            %��ȴ�ʱ��Ϊ0
            events(3,i)=0;
            %���뿪ʱ�̵��ڵ���ʱ�������ʱ��֮��
            events(4,i)=events(1,i)+events(2,i);
            %���־λ��1
            events(5,i)=1;
            member=[member,i];
            %���ϵͳ�й˿����ڽ��ܷ�����ϵͳ�ȴ�����δ�������i���˿ͽ���ϵͳ
        else len_mem=length(member);
            %��ȴ�ʱ����ڶ�����ǰһ���˿͵��뿪ʱ�̼�ȥ�䵽��ʱ��
            events(3,i)=events(4,member(len_mem))-events(1,i);
            %���뿪ʱ�̵��ڶ�����ǰһ���˿͵��뿪ʱ�̼��������ʱ��
            events(4,i)=events(4,member(len_mem))+events(2,i);
            %��ʶλ��ʾ�����ϵͳ��ϵͳ�ڹ��еĹ˿���
            events(5,i)=number+1;
            member=[member,i];
        end
    end
end
%�������ʱ������ϵͳ���ܹ˿���
len_mem=length(member);
%*****************************************
%������
%*****************************************
%�����ڷ���ʱ���ڣ�����ϵͳ�����й˿͵ĵ���ʱ�̺��뿪ʱ������ͼ��stairs�����ƶ�ά����ͼ��
stairs((0:len_mem),[0 events(1,member)]);
%,'LineWidth',1.5,'Marker','d','MarkerFaceColor','c'
hold on;
stairs((0:len_mem),[0 events(4,member)]+.2,'-g');
%,'LineWidth',1.5,'Marker','o','MarkerFaceColor','c'
legend('Arrival Time','Departure Time');
xlabel('Vehicle Ordinal');ylabel('Time/h');
hold off;grid on;
%�����ڷ���ʱ���ڣ�����ϵͳ�����й˿͵�ͣ��ʱ��͵ȴ�ʱ������ͼ��plot�����ƶ�ά����ͼ��
figure;
plot(1:len_mem,events(3,member)/6,1:len_mem,events(2,member)+events(3,member));
%'y-o',%,'m-d','LineWidth',1.5
legend('Waiting Time','Delay Time');
xlabel('Vehicle Ordinal');ylabel('Time/h');grid on