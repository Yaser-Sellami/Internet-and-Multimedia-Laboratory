f = imread("lena.jpg");
qual = [100, 90, 80, 70, 60, 50, 40, 30, 20, 10, 0]; %vector containing the values of quality
figure;

subplot(3,4,1)
imshow(f)
title("Original image");

for i = 1:length(qual)
    q = qual(i);
    file_name = "lena-"+q;
    imwrite(f, file_name, "jpeg", "Quality", q);
    
    peak_snr = psnr(imread(file_name), f);
    struc_sim_ind = ssim(imread(file_name), f);

    fprintf("\nThe PSNR of image %s is %3.2f",file_name, peak_snr);
    fprintf("\nThe SSIM of image %s is %3.2f\n",file_name, struc_sim_ind);

    subplot(3,4,i+1);
    imshow(imread(file_name));
    titolo=[file_name,'PSNR=',num2str(peak_snr),'SSIM=',num2str(struc_sim_ind)];
    title(titolo);
end