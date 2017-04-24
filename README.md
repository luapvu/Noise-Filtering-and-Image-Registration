In this project I implemented a program that can take a rotated image and map it to a non rotated selfie image. The program uses the concept of Image Registration, mapping coordinates of an image based on landmarks to a function such that the function maps each pixel in the rotated image to an interpolated version of the image where the face is no longer rotated. 

In addition to this, I also take a satellite image of Saturn taken by NASA in 2005 which depicted periodic and salt and pepper noise. I then accurately filter out all noise from the image using my understanding of median filters and frequency domain analysis. I filter out periodic noise using a high pass notch filter to remove the periodic noise in the frequency domain. 

To execute the function run the main.m script and select the landmarks for both images. In the supplied code, the landmarks have been hardcoded in with the values used in the report, to test your own landmark values uncomment the 3 lines of “cpselect” commands in the main.m file, and comment out the hardcoded values for p, p1, p2, q, q1, q2.

Further details can be found in the pdf report.
