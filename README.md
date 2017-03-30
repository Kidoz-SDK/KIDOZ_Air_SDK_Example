<a href="url"><img src="https://github.com/Kidoz-SDK/Kidoz_Android_SDK_Example/blob/master/graphics/App%20icon.png" align="left" height="72" width="72" ></a>
[<img src="https://kidoz-cdn.s3.amazonaws.com/wordpress/kidoz_small.gif" width="533px" height="300px">](https://www.youtube.com/watch?v=-ljFjRn7jeM)
KIDOZ SDK + Sample Application (ANE)
=================================
**KIDOZ SDK Android Extension (ANE) compatible with Android 4.0 (API level 14) and above. Sample app is compiled with Flex SDK 20.0 on   Flash Builder 4.7**

*Updated to KIDOZ Android SDK version 0.7.4*
*Updated to KIDOZ iOS SDK version 0.5.9*

### [API Documentation](https://s3.amazonaws.com/kidoz-cdn/sdk/APIDocumentation/Android/AdobeAirExtension/0.5.6/index.html)

This Flex Mobile application project provides an example of the [KIDOZ](http://www.kidoz.net) SDK integration for Adobe Air applications.

The example application contains the following creative tools:
Recommended units:
* KIDOZ Panel view (+Family) content tool - the `PanelView`
* KIDOZ Interstitial view content tool - the `InterstitialView`
* KIDOZ Rewarded view content tool - the `RewardedView`
Deprecated units:
* KIDOZ Feed view content tool - the `FeedView` 
* KIDOZ Flexi Point view content tool - the `FlexiView` (Android only)


The sample application `KidozSdkSampleApp` contains the `KidozSdkAir.ane` file, which is the `Android Native Extension (ANE)` for KIDOZ SDK: this file should be downloaded and copied to your project to integrate the KIDOZ SDK.  

Running the sample app

1. Download / Clone the `KidozSdkSampleApp`
2. Add it to your Flash® Builder™® 
3. Run the application as a mobile android application (Only `Google Android` Target platform And `On Device` Launch method are supported).

<br/>

KIDOZ SDK - Getting Started
=================================
You can read more about the KIDOZ SDK on [KIDOZ SDK](https://github.com/Kidoz-SDK/Documentation/wiki)

###IMPORTANT!
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
<a href="url"><img src="https://s3.amazonaws.com/kidoz-cdn/sdk/air_tut_1.jpg" align="left" height="564" width="975" ></a>
</br>


</br>
<a href="url"><img src="https://s3.amazonaws.com/kidoz-cdn/sdk/air_tut_2.jpg" align="left" height="618" width="980" ></a>
</br>

</br>
<a href="url"><img src="https://s3.amazonaws.com/kidoz-cdn/sdk/air_tut_3.jpg" align="left" height="564" width="932" ></a>
</br>


#### App Manifest Definitions:  `..-app.xml` (IMPORTANT)
For correct flow of the SDK add the following lines in the `<android>` section of your `..-app.xml` file (Application definition xml file) located in the root of the `src` folder of you project.

```xml
<manifestAdditions><![CDATA[
	<manifest android:installLocation="auto">		
			 
	        <uses-permission android:name="android.permission.INTERNET"/>
		<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>		
				    
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


#Initializing the SDK
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

KIDOZ Panel
<a href="url"><img src="https://s3.amazonaws.com/kidoz-cdn/sdk/panel_view_sample_image.png" align="right" height="121" width="200" ></a>

`PanelView` is a customized special view that can slide in/out of the screen (both in horizontal and vertical layout) with minimal interference to user experience.
The `PanelView` can be placed on one of four sides of the activity screen - `PANEL_TYPE.TOP`,`PANEL_TYPE.BOTTOM`,`PANEL_TYPE.RIGHT`,`PANEL_TYPE.LEFT` 
</br>
The `PanelView` can be controlled via a special `Handle` button that can be located in any of the 3 following positions -  
`HANDLE_POSITION.START`,`HANDLE_POSITION.CENTER`,`HANDLE_POSITION.END` depending on the `PanelView` initial screen location.
</br>
<a href="url"><img src="https://s3.amazonaws.com/kidoz-cdn/sdk/sdk_panel_layout.jpg" align="center" height="500" width="433" ></a>
</br>

KIDOZ Panel View support 2 modes `Normal PanelView` and `Family PanelView`.
`Family PanelView` is a unit designed to comply with Google's Designed for Families Policy.

#####To add the Normal Panel to your view use: 

```javascript
     /** Add Panel to View  */
     controller.addPanleView(SdkController.PANEL_TYPE_BOTTOM,SdkController.HANDLE_POSITION_END,false);	
```

#####To add the Family Panel to your view use: 

```javascript
     /** Add Panel to View  */
     controller.addPanleView(SdkController.PANEL_TYPE_BOTTOM,SdkController.HANDLE_POSITION_END,true);	
```

- You can change the color of the Panel on runtime by using:
```javascript
     controller.setPanelViewColor("#FF9F3087");
```

- To invoke `PanelView` programmatically use:
```javascript
    /**
     * Expand panel view programmatically
     */
     controller.expandPanelView();	
```
and

```javascript
     /**
     * Collapse panel view programmatically
     */
     controller.collapsePanelView();
```

- To check the `PanelView` current view state use:
```javascript
     /**
     * Check if panel expanded or colapssed
     */
     controller.isPanelExpanded();
```

You can implement `IPanelViewInterface` interface if you want to be informed when the `PanelView` is Collapsed/Expanded by creating a class that implements the interface.

```javascript
 	import com.kidoz.sdk.api.platforms.IPanelViewInterface;
	import com.kidoz.sdk.api.platforms.SdkController;
	
	/** Example Implementation of the Panel View events listener  */
	public class PanelViewActionListener implements IPanelViewInterface
	{		
		var mController:SdkController;
		
		public function PanelViewActionListener(controller:SdkController)
		{
			mController = controller;
		}
		
		/** On Panel view expanded callback */
		public function onPanelViewExpanded():void {
			mController.printToastDebugLog("Feed Panel Expanded");
		} 
		
		/** On Panel view collapsed callback */
		public function onPanelViewCollapsed():void {
			mController.printToastDebugLog("Feed Panel Collapsed");
		} 
		
		/** On Panel view ready callback */
		public function onPanelViewReady():void {
			mController.printToastDebugLog("Feed Panel Ready");
		} 
	}
```

- Set interface by:
```javascript
        /**
	 * Set Panel View events listener
	 * Used to catch panel view events (Expand/Collaps)
	 *  */
	controller.setOnPanelViewEventListener(new PanelViewActionListener(controller));
```

#KIDOZ Interstitial / Rewarded
##Request interstitial ad 
```javascript
	import com.kidoz.sdk.api.platforms.SdkController; 
	controller.loadInterstitialView(false);
```
##Request rewarded ad 
```javascript
	import com.kidoz.sdk.api.platforms.SdkController; 
	controller.loadRewardedVideoView(false);
```
##showing the interstitial / rewarded ad
After receiving the interstitial reay event it is possible to call the show function
```javascript
	/** Show kidoz feed view */
 	controller.showInterstitialView();
```

##Setting the listeners 
```javascript
	/** Show kidoz feed view */
 	controller.setOnInterstitialEventListener(new InterstitialViewActionListener(controller));
```
The supported listeners are:
```javascript
public function InterstitialViewActionListener(controller:SdkController)
		{
			mController = controller;
		}
		 	
		/** On intersitial view expanded callback */
		public function onClosed():void {
			mController.printToastDebugLog("Interstitial Closed");
		} 
		
		/** On intersitial view collapsed callback */
		public function onOpened():void {
			mController.printToastDebugLog("Interstitial Opened");
		} 
		
		/** On intersitial view collapsed callback */
		public function onReady():void {
			mController.printToastDebugLog("Interstitial Ready");
		} 
		
		/** On interstitial//rewarded fail callback */
		public function onLoadFailed():void {
			mController.printToastDebugLog("Interstitial onLoadFailed");
		} 
		
		/** On rewarded end callback */
		public function onRewarded():void {
			
		} 
```

#KIDOZ Feed
##Calling the Feed View Programmatically
```javascript
	/** Show kidoz feed view */
 	controller.showFeedView();
```


You can implement `IFeedViewInterface` interface if you want to be informed when the `FeedView` is dismissed and/or about to be opened by creating a class that implements the interface.

```javascript
 	import com.kidoz.sdk.api.platforms.IFeedViewIntefrace;
	import com.kidoz.sdk.api.platforms.SdkController;
	
	/** Example Implementation of the Feed events listener  */
	public class FeedActionListener implements IFeedViewIntefrace
	{	
		var mController:SdkController;
		
		public function FeedActionListener(controller:SdkController)
		{
			mController = controller;
		}	 		
		public function onDismissView():void {
			mController.printToastDebugLog("Feed view dismissed");
		} 
		public function onReadyToShow():void {
			mController.printToastDebugLog("Feed view shown");
		} 
	}
```

- Set interface by:
```javascript
        /**
	 * Set Feed events listener
	 * Used to catch feed view events (Show/Dismiss)
	 *  */
	controller.setOnFeedViewEventListener(new FeedActionListener(controller));
```

##Adding the KIDOZ Feed Button
<a href="url"><img src="https://kidoz-cdn.s3.amazonaws.com/sdk/btn_animation.gif" align="right" height="96" width="96" ></a>
You can also call the `Feed View` by adding the `Feed Button` - in this case the `Feed View` will be shown following a click on the `Feed Button`. 

- 	Add `FeedButton` by:
	
```javascript
 	/** Add feed default Button to view  */
	controller.addFeedButton(20,90);	
```

We recommend using KIDOZ default button - the `Feed Button`, which is a customizable animated button.



#KIDOZ Flexi Point View (Android only)
<a href="url"><img src="https://s3.amazonaws.com/kidoz-cdn/sdk/flexi_sample_preview.png" align="right" height="300" width="300" ></a>

`FlexiView` is a small interactive single content view, which hovers over the screen content.  

##Adding the Flexi View Programmatically

`FlexiView` accepts an anchor position; there are 8 initial positions available:

```javascript
	// Flexi View Anchor Position
	public static const FLEXI_VIEW_POSITION_TOP_START; 
	public static const FLEXI_VIEW_POSITION_TOP_CENTER; 
	public static const FLEXI_VIEW_POSITION_TOP_END; 	
	public static const FLEXI_VIEW_POSITION_MID_START; 		
	public static const FLEXI_VIEW_POSITION_MID_CENTER; 		
	public static const FLEXI_VIEW_POSITION_MID_END; 
	public static const FLEXI_VIEW_POSITION_BOTTOM_START; 		
	public static const FLEXI_VIEW_POSITION_BOTTOM_CENTER; 		
	public static const FLEXI_VIEW_POSITION_BOTTOM_END;
 ```


```javascript
/**
 * Add Fexi view
 * */
controller.addFlexiView(true,SdkController.FLEXI_VIEW_POSITION_TOP_START);
```

- To Show / Hide Flexi View use:
```javascript
/**
 * Show flexi view (Make it visible)
 *  */
controller.showFlexiView();

 /**
 * Hide flexi view (Make it visible)
 *  */
controller.hideFlexiView();
```

You can implement `IFlexiViewInterface` interface if you want to be informed of `Flexi View` events by creating a class that implements the interface.

```javascript
 	import com.kidoz.sdk.api.platforms.IFlexiViewInterface;
	import com.kidoz.sdk.api.platforms.SdkController;
	
	/** Example Implementation of the Flexi View events listener  */
	public class FlexiViewActionListener implements IFlexiViewInterface
	{		
		var mController:SdkController;
		
		public function FlexiViewActionListener(controller:SdkController)
		{
			mController = controller;
		}	
	
		/** On Flexi view ready callback */
		public function onFlexiViewReady():void {
			mController.printToastDebugLog("Flexi view Ready");
		} 
		
		/** On Flexi view visible callback */
		public function onFlexiViewVisible():void {
			mController.printToastDebugLog("Flexi view Visible");
		} 
		
		/** On Flexi view hidden callback */
		public function onFlexiViewHidden():void {
			mController.printToastDebugLog("Flexi view Hidden");
		} 
	}
```

- Set interface by:
```javascript
	/**
	 * Set Flexi Point View events listener
	 * Used to catch Flexi point view events
	 *  */
	controller.setOnFlexiViewEventListener(new FlexiViewActionListener(controller));
```

For any question or assistance, please contact us at SDK@kidoz.net.
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

