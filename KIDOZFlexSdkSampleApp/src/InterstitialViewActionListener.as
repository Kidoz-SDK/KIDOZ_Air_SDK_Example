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
		
		/** On interstitial fail callback */
		public function onLoadFailed():void {
			mController.printToastDebugLog("Interstitial onLoadFailed");
		} 
		
	}
}