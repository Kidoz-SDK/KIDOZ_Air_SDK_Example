<a href="url"><img src="https://github.com/Kidoz-SDK/Kidoz_Android_SDK_Example/blob/master/graphics/App%20icon.png" align="left" height="72" width="72" ></a>

KIDOZ SDK Abobe Air Android Extension (ANE)
=================================
**KIDOZ SDK Android Extension (ANE) compatible with Android 4.0 (API level 14) and above. Sample app is compiled with Air SDK 19.0 on   Flash® Builder™® 4.7 **

*Updated to KIDOZ SDK version 0.2.2*

This Flex Mobile application  project provides an example of the [KIDOZ](http://www.kidoz.net) SDK integration for Adobe Air applications.

The example application contains the following creative tools:
* KIDOZ's Feed view content tool - the `Feed View`
* KIDOZ's Panel view content tool - the `Panel View`


The sample application `KidozSdkSampleApp` containes the `Android Native Extension (ANE)` of the Kidoz SDK called  `KidozSdkAir.ane`. This file should be taken and copied to Your project in order to use Kidoz SDK functionality.

###Running the sample app
Add it to Flash® Builder™® 4.7 and run it as mobile android application on Device. (Only `Google Android` Target platform And `On Device` Launch method is supported).

</br>

KIDOZ SDK - Getting Started
=================================
- 	Read the full KIDOZ SDK documentation and `Best Practices` on [KIDOZ SDK](http://kidoz.net/marketing/newsletter/sdk/SDK.pdf) website
 
	The easiest way to use the SDK is following this 3 steps:

1. Copy `KidozSdkAir.ane` android extension file from the sample application to Your project.
1. Include the `KidozSdkAir.ane  (KIDOZ SDK)` library inside your project
2. Inititiate the `SdkController`
3. Open the `Feed View` programmatically , adding the `KIDOZ Feed Button` or `KIDOZ Panel View` to your `Main Activity`


####Include the library

Copy `KidozSdkAir.ane` file from SampleApplication to YOUR project.

1. Right click on the project and select `Properties`.
2. In opened widnow Select Flex Build Path and then click Native Extensions. ( Figure 1).
3. Click (Add ANE) and select `KidozSdkAir.ane`  .
4. Select Flex Build Packaging and then click Native Extensions and check the empty box of recently added ANE. ( Figure 2).



</br>
<a href="url"><img src="https://s3.amazonaws.com/kidoz-cdn/sdk/air_tut_1.jpg" align="left" height="450" width="777" ></a>
</br>



</br>
<a href="url"><img src="https://s3.amazonaws.com/kidoz-cdn/sdk/air_tut_2.jpg" align="left" height="450" width="742" ></a>
</br>


