function r3d= fcn_r3d(zeta,para)

r3d=fcn_mu(zeta,para)./norm(fcn_mu(zeta,para));

end