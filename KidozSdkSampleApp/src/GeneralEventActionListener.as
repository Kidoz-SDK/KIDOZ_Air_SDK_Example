package
{ 
	import com.kidoz.sdk.api.platforms.IGeneralEventInterface;
	import com.kidoz.sdk.api.platforms.SdkController;
	
	/** Example Implementation of the Flexi View events listener  */
	public class GeneralEventActionListener implements IGeneralEventInterface
	{		
		var mController:SdkController;
		
		public function GeneralEventActionListener(controller:SdkController)
		{
			mController = controller;
		}	
	
		/** On Player opened (Web player, Video player) and etc..) */
		public function onPlayerOpened():void {
			mController.printToastDebugLog("Player Event Opened");
		} 
		
		/** On Player closed (Web player, Video player) and etc..) */
		public function onPlayerClosed():void {
			mController.printToastDebugLog("Player Event Closed");
		} 
		
		 
	}
} 	 