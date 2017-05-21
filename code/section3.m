close all;
clear all;
clc;

img1 = imread('image1.png');
img2 = imread('image2.png');
imshow(img1)
title('Original Picture');
figure
imshow(img2);
title('Original Picture');
[ Sx, Sy, phi_low, phi_high ] = subsection_c(img1, true);
subsection_d_for_images(5e5, img1, Sx, Sy, phi_low, phi_high);
subsection_e_for_images(5e5, Sx, Sy, phi_low, phi_high, img1);
[ Sx, Sy, phi_low, phi_high ] = subsection_c(img2, true);
subsection_d_for_images(500000, img2, Sx, Sy, phi_low, phi_high);
subsection_e_for_images(5e5, Sx, Sy, phi_low, phi_high, img2);
