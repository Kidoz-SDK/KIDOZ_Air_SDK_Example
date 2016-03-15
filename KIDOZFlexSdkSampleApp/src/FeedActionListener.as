package
{
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
}