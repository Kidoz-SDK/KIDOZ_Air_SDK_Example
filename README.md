<a href="url"><img src="https://github.com/Kidoz-SDK/Kidoz_Android_SDK_Example/blob/master/graphics/App%20icon.png" align="left" height="72" width="72" ></a>

KIDOZ SDK + Sample Application (ANE)
=================================
**KIDOZ SDK Android Extension (ANE) compatible with Android 4.0 (API level 14) and above. Sample app is compiled with Air SDK 19.0 on   Flash Builder 4.7**

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
2. In opened widnow Select `Flex Build Path` and then click `Native Extensions`. ( Figure 1).
3. Click (Add ANE) and select `KidozSdkAir.ane` file .
4. Select `Flex Build Packaging` and then click `Native Extensions` and check the empty box of recently added ANE. ( Figure 2).



</br>
<a href="url"><img src="https://s3.amazonaws.com/kidoz-cdn/sdk/air_tut_1.jpg" align="left" height="564" width="975" ></a>
</br>


</br>
<a href="url"><img src="https://s3.amazonaws.com/kidoz-cdn/sdk/air_tut_2.jpg" align="left" height="618" width="980" ></a>
 


#### Application File Manifets Defenitions:  `..-app.xml` (IMPORTANT)
For correct flow of the SDK add the folowing lines in the `<android>` section of your `..-app.xml` file ( Application defenition xml file) located in the root of the `src` folder of you project.

```xml
 	<manifest android:installLocation="auto">	
 	     <!-- SDK Requierd  permissions -->
	    <uses-permission android:name="android.permission.INTERNET"/>
	    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
	    
	     <!-- Config changes requiered for correct SDK flow -->
	    <activity android:configChanges="screenLayout|screenSize|orientation|keyboard"/> 
	    
	    <!-- SDK DEFENITIONS -->
        <receiver android:name="com.kidoz.sdk.api.receivers.SdkReceiver" >
            <intent-filter>
                <action android:name="android.intent.action.PACKAGE_ADDED" />

                <data android:scheme="package" />
            </intent-filter>
        </receiver>
        
        <!-- SDK DEFENITIONS -->
	</manifest>
``` 


#Initializing the SDK
Sdk should be initialized only once
When initializing the SDK, please make sure to use your given `publisherID` and `securityToken`, which can be retrieve by contacting with SDK@kidoz.net.

Initiate SDK by creating `SdkControler` instance

```javascript

 	/** Initiate Kidoz SDK by creating an SdkControler instance
	 * 
	 * @throws RuntimeException in case of invalid or missing publisher_id or security token
	 *  */
	static var controller:SdkController = SdkController.initSdkContoller("5","i0tnrdwdtq0dm36cqcpg6uyuwupkj76s");
```

#KIDOZ Panel
<a href="url"><img src="https://s3.amazonaws.com/kidoz-cdn/sdk/panel_view_sample_image.png" align="right" height="121" width="200" ></a>

`PaneView` is a customized special view that can slide in/out of the screen (both in horizontal and vertical layout) with minimal interference to user experience.
The `PanelView` can be place on one of four sides of the activity screen - `PANEL_TYPE.TOP`,`PANEL_TYPE.BOTTOM`,`PANEL_TYPE.RIGHT`,`PANEL_TYPE.LEFT` 
</br>
The `PanelView` can be controled via a special `Handle` button can that can be located in any of the 3 following positions -  
`HANDLE_POSITION.START`,`HANDLE_POSITION.CENTER`,`HANDLE_POSITION.END` depending on the `PaneView` initial Screen location.
</br>
<a href="url"><img src="https://s3.amazonaws.com/kidoz-cdn/sdk/sdk_panel_layout.jpg" align="center" height="500" width="433" ></a>
</br>

#####To add Panel to your view use : 

```javascript
     /** Add feed Panel to View  */
     controller.addPanleView(SdkController.PANEL_TYPE_BOTTOM,SdkController.HANDLE_POSITION_END);	
```

- You can change Color of the Panel on runtime by using:
```javascript
     controller.setPanelViewColor("#FF9F3087");
```

- To invoke `PaneView` programmatically use:
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

- To check the `PaneView` current view state use:
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
	
	/** Example Implementation of the Feed events listener  */
	/** Example Implementation of the PAnel View events listener  */
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


#KIDOZ Feed
##Calling the Feed View Programmatically
```javascript
	/** Show kidoz feed view */
 	controller.showFeedView();
```

You can implement `IFeedViewIntefrace` interface if you want to be informed when the `FeedView` is dismissed and/or about to be open by creating a class that implements the interface.

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

It's recommended to use KIDOZ's default button - the `Feed Button` which is a custom animatable button.

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

