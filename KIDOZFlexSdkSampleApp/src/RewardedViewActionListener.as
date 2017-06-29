package
{ 
	import com.kidoz.sdk.api.platforms.IRewardedEventInterface;
	import com.kidoz.sdk.api.platforms.SdkController;
	
	public class RewardedViewActionListener implements IRewardedEventInterface
	{		
		var mController:SdkController;
		public var mReady:Boolean;
		
		public function RewardedViewActionListener(controller:SdkController)
		{
			mController = controller;
			mReady = false;
		}
		 	
		/** On Rewarded view expanded callback */
		public function onClosed():void {
			mController.printToastDebugLog("Rewarded Closed");
			trace("Rewarded Opened");
		} 
		
		/** On Rewarded view collapsed callback */
		public function onOpened():void {
			mController.printToastDebugLog("Rewarded Opened");
			trace("Rewarded Opened");
		} 
		
		/** On Rewarded view collapsed callback */
		public function onReady():void {
			mReady = true;
			mController.printToastDebugLog("Rewarded Ready");
			trace("Rewarded Ready");
		} 
		
		/** On Rewarded fail callback */
		public function onLoadFailed():void {
			mReady = false;
			mController.printToastDebugLog("Rewarded onLoadFailed");
			trace("v onLoadFailed");
		} 

		
		/** On rewarded callback */
		public function onRewarded():void {
			mReady = true;
			mController.printToastDebugLog("onRewarded");
			trace("onRewarded");
		} 
		
		/** On rewarded movie started callback */
		public function onRewardedVideoStarted():void {
			mController.printToastDebugLog("onRewardedVideoStarted");
			trace("onRewardedVideoStarted");
		}
		
		/** On Rewarded no offers callback */
		public function onRewardedNoOffers():void {
			mReady = false;
			mController.printToastDebugLog("Rewarded onRewardedNoOffers");
			trace("v onRewardedNoOffers");
		} 
	}
}