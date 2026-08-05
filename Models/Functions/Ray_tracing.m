%% Ray tracing function

function [t,u,v] = Ray_tracing(P0,P1,P2,r_ind,d_geo)

    if norm(r_ind) == 0

        t = 0;
        u = 0;
        v = 0;

    else
        Ray_tracing_A   =[-r_ind(1) P1(1)-P0(1) P2(1)-P0(1);
                          -r_ind(2) P1(2)-P0(2) P2(2)-P0(2);
                          -r_ind(3) P1(3)-P0(3) P2(3)-P0(3)];

        if abs(det(Ray_tracing_A)) < 1e-9

            t = 0;
            u = 0;
            v = 0;

        else

            Ray_tracing_b   = [d_geo(1)-P0(1);d_geo(2)-P0(2);d_geo(3)-P0(3)];
            Sol             = Ray_tracing_A\Ray_tracing_b;
    
            t = Sol(1); 
            u = Sol(2); 
            v = Sol(3);


        end
    
    end
    
end