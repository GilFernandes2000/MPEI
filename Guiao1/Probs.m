function [out1] = Probs(Nlance, Ncaras, Nexp)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
lancamentos = rand(Nlance, Nexp)>0.5;
sucessos = sum(lancamentos)==Ncaras;
out1 = sum(sucessos)/Nexp;
end

