package
{ 
	import com.kidoz.sdk.api.platforms.IBannerViewInterface;
	import com.kidoz.sdk.api.platforms.SdkController;
	
	/** Example Implementation of the Panel View events listener  */
	public class BannerViewActionListener implements IBannerViewInterface
	{		
		var mController:SdkController;
		
		public function BannerViewActionListener(controller:SdkController)
		{
			mController = controller;
		}
		
		/** On Banner ready callback */
		public function onBannerReady():void {
			mController.printToastDebugLog("Banner Ready");
		} 
		
		/** On Banner show callback */
		public function onBannerShow():void {
			mController.printToastDebugLog("Banner Show");
		} 
		
		/** On Banner hide callback */
		public function onBannerHide():void {
			mController.printToastDebugLog("Banner Hide");
		} 
		
		/** On Banner content loaded callback */
		public function onBannerContentLoaded():void {
			mController.printToastDebugLog("Banner Content Loaded");
		} 
		
		/** On Banner load failed callback */
		public function onBannerContentLoadFailed():void {
			mController.printToastDebugLog("Banner Content Load Failed");
		} 
	}
}


 