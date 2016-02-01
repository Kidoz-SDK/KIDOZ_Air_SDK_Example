package
{ 
	import com.kidoz.sdk.api.platforms.IFlexiViewInterface;
	import com.kidoz.sdk.api.platforms.SdkController;
	
	/** Example Implementation of the Panel View events listener  */
	public class FlexiViewActionListener implements IFlexiViewInterface
	{		
		var mController:SdkController;
		
		public function FlexiViewActionListener(controller:SdkController)
		{
			mController = controller;
		}	
	
		/** On Flexi view ready callback */
		public function onFlexiViewReady():void {
			mController.printToastDebugLog("Flexi view Ready");
		} 
		
		/** On Flexi view visible callback */
		public function onFlexiViewVisible():void {
			mController.printToastDebugLog("Flexi view Visible");
		} 
		
		/** On Flexi view hidden callback */
		public function onFlexiViewHidden():void {
			mController.printToastDebugLog("Flexi view Hidden");
		} 
	}
}