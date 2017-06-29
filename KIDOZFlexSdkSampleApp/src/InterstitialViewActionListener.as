package
{ 
	import com.kidoz.sdk.api.platforms.IInterstitialEventInterface;
	import com.kidoz.sdk.api.platforms.SdkController;
	
	/** Example Implementation of the Panel View events listener  */
	public class InterstitialViewActionListener implements IInterstitialEventInterface
	{		
		var mController:SdkController;
		public var mReady:Boolean;
		public function InterstitialViewActionListener(controller:SdkController)
		{
			mController = controller;
			mReady = false;
		}
		
		/** On intersitial view expanded callback */
		public function onClosed():void {
			mController.printToastDebugLog("Interstitial Closed");
			trace("Interstitial Opened");
		} 
		
		/** On intersitial view collapsed callback */
		public function onOpened():void {
			mController.printToastDebugLog("Interstitial Opened");
			trace("Interstitial Opened");
		} 
		
		/** On intersitial view collapsed callback */
		public function onReady():void {
			mReady = true;
			mController.printToastDebugLog("Interstitial Ready");
			trace("Interstitial Ready");
		} 
		
		/** On interstitial fail callback */
		public function onLoadFailed():void {
			mReady = false;
			mController.printToastDebugLog("Interstitial onLoadFailed");
			trace("Interstitial onLoadFailed");
		} 
		
		/** On Interstitial no offers callback */
		public function onInterstitialNoOffers():void {
			mReady = false;
			mController.printToastDebugLog("Interstitial onInterstitialNoOffers");
			trace("v onInterstitialNoOffers");
		} 

	}
}
