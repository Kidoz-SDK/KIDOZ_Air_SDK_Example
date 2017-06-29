package
{ 
	import com.kidoz.sdk.api.platforms.ISDKInitIntefrace;
	import com.kidoz.sdk.api.platforms.SdkController;
	
	/** Example Implementation of the Flexi View events listener  */
	public class SDKInitListener implements ISDKInitIntefrace
	{		
		var mController:SdkController;
		
		public function SDKInitListener(controller:SdkController)
		{
			mController = controller;
		}	
	
		/** On SDK Init Success callback */
		public function onInitSuccess():void {
			mController.printToastDebugLog("onInitSuccess()");
		}
		
		/** On SDK Init Error callback */
		public function onInitError():void {
			mController.printToastDebugLog("onInitError()");
		}
	}
}