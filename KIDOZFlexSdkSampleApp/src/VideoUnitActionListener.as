package
{ 
	import com.kidoz.sdk.api.platforms.IVideoUnitInterface;
	import com.kidoz.sdk.api.platforms.SdkController;
	
	/** Example Implementation of the Video Unit events listener  */
	public class VideoUnitActionListener implements IVideoUnitInterface
	{		
		var mController:SdkController;
		
		public function VideoUnitActionListener(controller:SdkController)
		{
			mController = controller;
		}
		
		/** On Video Unit ready callback */
		public function onVideoUnitReady():void {
			mController.printToastDebugLog("Video Unit Ready");
		}
		
		/** On Video Unit open callback */
		public function onVideoUnitOpen():void {
			mController.printToastDebugLog("Video Unit Open");
		} 
		
		/** On Video Unit close callback */
		public function onVideoUnitClose():void {
			mController.printToastDebugLog("Video Unit close");
		} 	
	}
}