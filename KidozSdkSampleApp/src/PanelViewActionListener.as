package
{ 
	import com.kidoz.sdk.api.platforms.IPanelViewInterface;
	import com.kidoz.sdk.api.platforms.SdkController;
	
	/** Example Implementation of the Panel View events listener  */
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
}