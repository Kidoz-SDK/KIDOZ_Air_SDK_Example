


<a href="url"><img src="https://github.com/Kidoz-SDK/Kidoz_Android_SDK_Example/blob/master/graphics/App%20icon.png" align="left" height="72" width="72" ></a>
[<img src="https://kidoz-cdn.s3.amazonaws.com/wordpress/kidoz_small.gif" width="533px" height="300px">](https://www.youtube.com/watch?v=-ljFjRn7jeM)

KIDOZ SDK + Sample Application (ANE) 
=================================
** KIDOZ SDK Android Extension (ANE) compatible with Android 4.2 (API level 17) and above , iOS 8.0 And above . Sample app is compiled with Flex SDK 20.0 on   Flash Builder 4.7**

*Updated to KIDOZ Android SDK version 0.8.8.3*
*Updated to KIDOZ iOS SDK version 1.3.2*

Due to new regulation by Google Play Design for Family policy , all references to YouTube were removed from the SDK.

This SDK version supports secured https protocol only and will resolve Google Play Security alert of Webview that is vulnerable to JavaScript interface injection.
Note that only secured external and internal events are supported from this version.

### [API Documentation](https://cdn.kidoz.net/sdk/APIDocumentation/Android/AdobeAirExtension/0.5.6/index.html)

This Flex Mobile application project provides an example of the [KIDOZ](http://www.kidoz.net) SDK integration for Adobe Air applications.

The example application contains the following creative tools:

_Recommended units_:
* KIDOZ Banner view content tool - the `BannerView` 
* KIDOZ Interstitial/Rewarded view content tool - the `InterstitialView`/`RewardedView`

Removed units:
* KIDOZ Panel view content tool - the `PanelView`
* KIDOZ Feed view content tool - the `FeedView` 
* KIDOZ Flexi Point view content tool - the `FlexiView` 


The sample application `KidozSdkSampleApp` contains the `KidozSdkAir.ane` file, which is the `Android Native Extension (ANE)` for KIDOZ SDK: this file should be downloaded and copied to your project to integrate the KIDOZ SDK.  

## Running the sample app

1. Download / Clone the `KidozSdkSampleApp`
2. Add it to your Flash® Builder™® 
3. Run the application as a mobile android application (Only `Google Android` Target platform And `On Device` Launch method are supported).

<br/>

### KIDOZ SDK - Getting Started
=================================

You can read more about the KIDOZ SDK on [KIDOZ SDK](https://github.com/Kidoz-SDK/Documentation/wiki)

### IMPORTANT!
In case there is some other `.ANE` files that already includes the V4 libary (getting errors during build phase) such as (Google Play Service, AdMob or othe libs) then you should NOT include the `supportV4Air.ane` file to your project only the `KidozFlexSdkLib.ane`. 
<br>

Include the library
Copy `KidozFlexSdkLib.ane` and the `supportV4Air.ane` files from SampleApplication to YOUR project. <br/>

1. Right click on the project and select `Properties`.
2. In opened window select `Flex Build Path` and then click `Native Extensions`. (Figure 1).
3. Click (Add ANE) and select `KidozFlexSdkLib.ane` file and the `supportV4Air.ane` file.
4. Select `Flex Build Packaging` and then click `Native Extensions` and check the empty box of recently added ANE. (Figure 2).
5. Add to compiler arguments `-swf-version` that is adjusted to currently used Air SDK. For Air SDK version `19.0` set `-swf-version 30` (Figure 3)

<br/>
Example for adding only the KIDOZ SDK ane

</br>
<a href="url"><img src="https://cdn.kidoz.net/sdk/air_tut_1.jpg" align="left" height="564" width="975" ></a>
</br>


</br>
<a href="url"><img src="https://cdn.kidoz.net/sdk/air_tut_2.jpg" align="left" height="618" width="980" ></a>
</br>

</br>
<a href="url"><img src="https://cdn.kidoz.net/sdk/air_tut_3.jpg" align="left" height="564" width="932" ></a>
</br>


App Manifest Definitions:  `..-app.xml` (IMPORTANT)
For correct flow of the SDK add the following lines in the `<android>` section of your `..-app.xml` file (Application definition xml file) located in the root of the `src` folder of you project.

```xml
<manifestAdditions><![CDATA[
	<manifest android:installLocation="auto">		
			 
	        <uses-permission android:name="android.permission.INTERNET"/>				    
	        <application android:hardwareAccelerated="true">		
			    			  				 	   				    
			<activity android:name="com.kidoz.sdk.api.ui_views.interstitial.KidozAdActivity"
	                  android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize">
	                </activity> 
	                	    
		        <receiver android:name="com.kidoz.sdk.api.receivers.SdkReceiver" >
		            <intent-filter>
		                <action android:name="android.intent.action.PACKAGE_ADDED" />		
		                <data android:scheme="package" />
		            </intent-filter>
		        </receiver>		
			                
		</application>

	</manifest>
]]></manifestAdditions>
``` 


# Initializing the SDK
SDK should be initialized only once.
When initializing the SDK, please make sure to use your given `publisherID` and `securityToken`, which can be retrieved by contacting SDK@kidoz.net.

Initiate SDK by creating `SdkControler` instance

```javascript

 	/** Initiate Kidoz SDK by creating an SdkControler instance
	 * 
	 * @throws RuntimeException in case of invalid or missing publisher_id or security token
	 *  */
	static var controller:SdkController = SdkController.initSdkContoller("5","i0tnrdwdtq0dm36cqcpg6uyuwupkj76s");
```
# KIDOZ SDK Init
## General
You can now register to be notified of successfuly sdk init event. If a problem occured during init an error event would fire.

## Setting the listeners 
```javascript
	controller.setSDKInitListener(new SDKInitListener(controller));	
```
SDKInitListener is just an object that implements the ISDKInitIntefrace interface. It's events:
```javascript
		/** On SDK Init Success callback */
		public function onInitSuccess():void {		
		}
		
		/** On SDK Init Error callback */
		public function onInitError():void {
		}
```



# KIDOZ Interstitial / Rewarded
## Request interstitial ad 
```javascript
	import com.kidoz.sdk.api.platforms.SdkController; 
	controller.loadInterstitialView(false);
```
## Request rewarded ad 
```javascript
	import com.kidoz.sdk.api.platforms.SdkController; 
	controller.loadRewardedView(false);
```
## Showing the interstitial / rewarded ad
After receiving the interstitial ready event it is possible to call the show function
```javascript
	/** Show kidoz interstitial / rewarded view */
 	controller.showInterstitialView();
	controller.showRewardedView();
```

## Setting the listeners 
```javascript
 	controller.setOnInterstitialEventListener(new InterstitialViewActionListener(controller));
	controller.setOnRewardedEventListener(new RewardedViewActionListener(controller));	
```

Interstitial Listener:
```javascript
import com.kidoz.sdk.api.platforms.IInterstitialEventInterface;
public function InterstitialViewActionListener(controller:SdkController)
		/** On intersitial view expanded callback */
		public function onClosed():void {
		} 
		
		/** On intersitial view collapsed callback */
		public function onOpened():void {
		} 
		
		/** On intersitial view collapsed callback */
		public function onReady():void {
		} 
		
		/** On interstitial fail callback */
		public function onLoadFailed():void {
		} 
		
		/** On Interstitial no offers callback */
		public function onInterstitialNoOffers():void {
		} 	
		
```


Rewarded Listener:
```javascript
import com.kidoz.sdk.api.platforms.IRewardedEventInterface;
public function InterstitialViewActionListener(controller:SdkController)
/** On Rewarded view expanded callback */
		public function onClosed():void {
		} 
		
		/** On Rewarded view collapsed callback */
		public function onOpened():void {
		} 
		
		/** On Rewarded view collapsed callback */
		public function onReady():void {
		} 
		
		/** On Rewarded fail callback */
		public function onLoadFailed():void {
		} 

		
		/** On rewarded callback */
		public function onRewarded():void {
		} 
		
		/** On rewarded movie started callback */
		public function onRewardedVideoStarted():void {
		}
		
		/** On Rewarded no offers callback */
		public function onRewardedNoOffers():void {
		} 
		
```

# KIDOZ Banner 
## Request banner ad 


```javascript
	import com.kidoz.sdk.api.platforms.SdkController; 
	controller.addBannerView(SdkController.BANNER_POSITION_BOTTOM);
```

## Request banner ad And Show


```javascript
	import com.kidoz.sdk.api.platforms.SdkController; 
	controller.addBannerViewExtended(SdkController.BANNER_POSITION_BOTTOM,ture);
```

The banner can be placed on one of six sides of the screen : `BANNER_POSITION_TOP`, `BANNER_POSITION_BOTTOM` ,`BANNER_POSITION_TOP_LEFT` ,`BANNER_POSITION_TOP_RIGHT` ,`BANNER_POSITION_BOTTOM_LEFT` ,`BANNER_POSITION_BOTTOM_RIGHT`.


## Showing the banner ad
After receiving the banner ready event it is possible to call the show function
```javascript
	/** Show kidoz banner view */
 	controller.showBannerView();
```

## Hiding the banner ad
After the banner is showing it is possible to call the hide function
```javascript
	/** Hide kidoz banner view */
 	controller.hideBannerView();
```
## Change Banner Position
Before the banner ready event it is possible to call the change Banner Position function
```javascript
	/** Change Banner Position */
 	controller.changeBannerViewPosition(SdkController.BANNER_POSITION_BOTTOM);
```

## Setting the listeners 
```javascript
 	controller.setOnBannerViewEventListener(new BannerViewActionListener(controller));
```

Banner Listener:
```javascript
import com.kidoz.sdk.api.platforms.IBannerViewInterface;
public function BannerViewActionListener(controller:SdkController)
		/** On banner view ready callback */
		public function onBannerReady():void {
		} 
		
		/** On banner view show callback */
		public function onBannerShow():void {
		} 
		
		/** On banner view hide callback */
		public function onBannerHide():void {
		} 
		
		/** On banner load failed callback */
		public function onBannerContentLoadFailed():void {
		} 
		
		/** On Banner no offers callback */
		public function onBannerNoOffers():void {
		} 	
		
```
# For any question or assistance, please contact us at SDK@kidoz.net.
</br>

License
--------

    Copyright 2015 KIDOZ, Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

