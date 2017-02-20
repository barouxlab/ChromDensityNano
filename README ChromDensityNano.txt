README ChromDensityNano

The following codes allow for a spatial analysis of chromatin density signal from transmission electrom microscopy (TEM) images. For details see Nanoscale changes in chromatin organization represent the initial steps of tumorigenesis: a transmission electron microscopy study . Lusik Cherkezyan, Yolanda Stypula-Cyrus, Hariharan Subramanian, Craig White, Mart Dela Cruz, Ramesh K Wali, Michael J Goldberg, Laura K Bianchi, Hemant K Roy and Vadim Backman. BMC Cancer 2014 14:189. DOI: 10.1186/1471-2407-14-189

A step-by-step guide to perform chromatin density analysis using these codes is described in:
Transmission Electron Microscopy Imaging to analyse chromatin density distribution at the nanoscale level. Tohnyui Ndinyanka Fabrice, Lusik Cherkezyan, Christoph Ringli and Célia Baroux. Methods in Molecular Biology Springer Book Series, Ed NY, Special Issue “Plant Chromatin” (2017) in press

The first step consists in calculating and saving density autocorrelation functions (ACFs) of images that need to be analysed.  The second step is generating a best-fit for the distribution of D, one of the three parameters describing the ACF based on the Whittle-Matern family of functions, accross all images. This parameter evaluates the  nature of the spatial heterogeneity of chromatin density.
 
The graphical user interface is launched by running GUI_getACF_and_D.m in Matlab. To run properly it needs the functions rotavg.m, Fit_loop.m, get_ACF.m, and get_D.m saved in the same folder as the main GUI code. 
 
GUI_getACF_and_D.m
Matlab code for the graphical user interface. It launches the initial prompt window and necessary codes (see below) to perform the calculations 
GUI_getACF_and_D.fig
Matlab figure generating the frame for the interactive user prompt
get_ACF
Matlab function performing spatial signal autocorrelation analysis on each image and saving the output; it needs the rotavg.m and Fit_loop.m codes. 
Syntax:
[ACF, Rmin, SNR, prefix, outlier] = get_ACF (directory, prefix, SNR, Rmin,saveName, Display)
Inputs: 
"directory" - directory where images to analyze are saved
"prefix" - user-defined prefix of all files to be analyzed. If multiple images need to be analyzed with same prefix, follow it by "*" 
"SNR" - a logical variable that determines whether images with poor SNR need to be excluded
"Rmin" - size of the smallest resolvable spot (defined by image resolution), in pixels
"saveName" - name of file in which output data needs to be saved
"Display" - logical variable determining whether each calculated ACF needs to be displayed
Outputs contain some of the input parameters used for analysis along with the indices of the excluded images due to SNR (“outlier”) and the matrix ACF containing all calculated autocorrelations functions  
get_D.m
Matlab function finding parameters of the Whittle-Matern family of functions that ensure the best fit between a set of experimentally measured functions (ACF) and the analytical function, between the length scales rmin and Rmax (see Lusik et al, 2014). Uses function Fit_loop.m
Syntax: get_D(SavedACF,Rmin,saveName)
Inputs:
"SavedACF" - input file with the set of experimental functions to fit
"Rmin" - size of the smallest resolvable spot (defined by image resolution), in pixels
"savename" - name of file in which output data needs to be saved

rotavg.m
Function to find a rotational average around a center point from a 2D array rotational averaging about center (c1,c2) with sub array of length (len)
Syntax: ravg = rotavg(a2, len, c1, c2)

Fit_loop.m
Function to find parameters of the Whittle-Matern family of functions that ensure the best fit between a single experimentally measured function (ACF) and the analytical function, between the length scales rmin and Rmax (see Lusik et al, 2014)
Syntax: [m_out, lc_out, error] = Fit_loop(ACF,rmin,Rmax)

compare_D
Function performs initial statistical comparison between 2 sets of D values via a two-sided t-test assuming unequal variances using the output files of get_D.m. The function displays the first 100 points of average autocorrelation functions of each of the two groups overlayed on the same figure along with the two boxplots for all D values in each group. The function does not have any outputs apart from the displayed figures.
Syntax: compare_D(Dfile1, Dfile2) 

