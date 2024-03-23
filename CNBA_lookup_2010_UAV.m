function CNBA_point = CNBA_lookup_2010_UAV(Beta_q)

Beta_grid = [-30
             -28.0200000000000
             -25.9900000000000
             -24.0300000000000
             -22.0100000000000
             -20.0200000000000
             -18.0200000000000
             -16.0100000000000
             -14.0100000000000
             -12.0100000000000
             -10.0100000000000
             -8.01000000000000
             -6.01000000000000
             -4.01000000000000
             -2.02000000000000
              0
              2.02000000000000
              4.01000000000000
              6.01000000000000
              8.01000000000000
             10.0100000000000
             12.0100000000000
             14.0100000000000
             16.0100000000000
             18.0200000000000
             20.0200000000000
             22.0100000000000
             24.0300000000000
             25.9900000000000
             28.0200000000000
             30];

CNBA_vs_beta = [-0.0580700000000000
                -0.0550700000000000
                -0.0502600000000000
                -0.0459300000000000
                -0.0435300000000000
                -0.0411500000000000
                -0.0388000000000000
                -0.0363000000000000
                -0.0330200000000000
                -0.0290200000000000
                -0.0247000000000000
                -0.0193800000000000
                -0.0138000000000000
                -0.00846000000000000
                -0.00375000000000000
                -0.00100000000000000
                 0.00375000000000000
                 0.00846000000000000
                 0.0138000000000000
                 0.0193800000000000
                 0.0247000000000000
                 0.0290200000000000
                 0.0330200000000000
                 0.0363000000000000
                 0.0388000000000000
                 0.0411500000000000
                 0.0435300000000000
                 0.0459300000000000
                 0.0502600000000000
                 0.0550700000000000
                 0.0580700000000000];

CNBA_point = interp1(Beta_grid, CNBA_vs_beta, Beta_q);

end