package
{ 
	import com.kidoz.sdk.api.platforms.IInterstitialEventInterface;
	import com.kidoz.sdk.api.platforms.SdkController;
	
	/** Example Implementation of the Panel View events listener  */
	public class InterstitialViewActionListener implements IInterstitialEventInterface
	{		
		var mController:SdkController;
		
		public function InterstitialViewActionListener(controller:SdkController)
		{
			mController = controller;
		}
		 	
		/** On Panel view expanded callback */
		public function onClosed():void {
			mController.printToastDebugLog("Interstitial Opened");
		} 
		
		/** On Panel view collapsed callback */
		public function onOpened():void {
			mController.printToastDebugLog("Interstitial Closed");
		} 
		 
	}
}