function y = helper_filter_create(Fp, Ap, Ast, Fs)

Fp = (Fp / Fs) *2;
if 1 - Fp <= 0.1
    Fst = Fp + 0.05;
else
    Fst = Fp + 0.1;
end

lpFilt = designfilt('lowpassfir','PassbandFrequency',Fp, ...
         'StopbandFrequency',Fst,'PassbandRipple',Ap, ...
         'StopbandAttenuation',Ast,'DesignMethod','kaiserwin');
     
fvtool(lpFilt)

y = lpFilt.Coefficients;
end