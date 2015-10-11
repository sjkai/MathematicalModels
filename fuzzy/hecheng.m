function rhat=hecheng(r);
    % Author:         Anemone
    % Filename:       hecheng.m
    % Last modified:  2015-09-04 16:17
    % E-mail:         x565178035@126.com

    n=length(r);
    for i=1:n
        for j=1:n
            rhat(i,j)=max(min([r(i,:);r(:,j)']));
        end
    end
end

