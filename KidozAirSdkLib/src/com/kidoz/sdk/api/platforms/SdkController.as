package com.kidoz.sdk.api.platforms
{
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;

	public class SdkController  
	{
		// Panel Types
		public static const PANEL_TYPE_BOTTOM:int = 0; 
		public static const PANEL_TYPE_TOP:int = 1; 		
		public static const PANEL_TYPE_LEFT:int = 2; 
		public static const PANEL_TYPE_RIGHT:int = 3; 
		
		// Panel Handle Positions
		public static const HANDLE_POSITION_START:int = 0; 
		public static const HANDLE_POSITION_CENTER:int = 1; 
		public static const HANDLE_POSITION_END:int = 2; 		
		
        //-------------------------------------------------		
		private static var instance:SdkController;
		private static var extContext:ExtensionContext = null;	
		private static var mPublisher_id:String;
		private static var mToken:String;		
		private var mFeedViewListener:IFeedViewIntefrace = null;
		private var mPanelViewListener:IPanelViewInterface = null;
		
		private static const PANEL_VIEW_EVENT:String = "PANEL_VIEW_EVENT"; 
		private static const PANEL_VIEW_EVENT_EXPANDED:String = "PANEL_VIEW_EVENT_EXPANDED";
		private static const PANEL_VIEW_EVENT_COLLAPSED:String = "PANEL_VIEW_EVENT_COLLAPSED";
		private static const PANEL_VIEW_EVENT_PANEL_READY:String = "PANEL_VIEW_EVENT_PANEL_READY";
		
		private static const FEED_VIEW_EVENT:String = "FEED_VIEW_EVENT"; 
		private static const FEED_VIEW_EVENT_READY_TOSHOW:String = "FEED_VIEW_EVENT_READY_TOSHOW"; 
		private static const FEED_VIEW_EVENT_DISMISS:String = "FEED_VIEW_EVENT_DISMISS"; 
				
		
		// Sdk controler constructor
		function SdkController(enforcer:SingletonEnforcer)
		{
			extContext = ExtensionContext.createExtensionContext("com.kidoz.sdk.api.platforms","KidozAirBridgeExtension");
			if(extContext) {
				// Add events listener from android native extension
				extContext.addEventListener( StatusEvent.STATUS,onStatusEventHandler);
			}
			
			if ( !extContext ) {
				throw new Error( "Volume native extension is not supported on this platform." );
			}
		} 
		
		/**
		 * Initiate Kidoz sdk controller
		 * 
		 * @param publisher_id
		 * @param String
		 */
		public static function initSdkContoller(publisher_id:String,token:String):SdkController {
			mPublisher_id = publisher_id;
			mToken = token;
			if (instance == null) {
				instance = new SdkController( new SingletonEnforcer());		
				if(instance) {
					extContext.call( "initSdk",publisher_id,token);
				}				
			}		
			return instance;
		}
		 	
		/**
		 * Status event handler , to handle events from native android extension
		 */
		private function onStatusEventHandler(event : StatusEvent ):void {
			if(event.code == FEED_VIEW_EVENT) {				
				 if(mFeedViewListener) {
					 if(event.level == FEED_VIEW_EVENT_READY_TOSHOW) {
						 mFeedViewListener.onReadyToShow();
					 }else if(event.level == FEED_VIEW_EVENT_DISMISS){
						 mFeedViewListener.onDismissView();
					 }
				 }
			}else if(event.code == PANEL_VIEW_EVENT){			
				if(mPanelViewListener) {
					if(event.level == PANEL_VIEW_EVENT_EXPANDED) {
						mPanelViewListener.onPanelViewExpanded();
					}else if(event.level == PANEL_VIEW_EVENT_COLLAPSED){
						mPanelViewListener.onPanelViewCollapsed();
					}else if(event.level == PANEL_VIEW_EVENT_PANEL_READY){
						mPanelViewListener.onPanelViewReady();
					}	
				}
			}					
		} 
		
		/**
		 * Add feed button to view
		 * 
		 * @param x_coord the x coordinate of the view position
		 * @param y_coord the y coordinate of the view position
		 */
		public function addFeedButton(x_coord:Number,y_coord:Number):void {
			if(extContext != null) {
				extContext.call("addFeedButton",x_coord,y_coord);
			}			
		}
		
		/**
		 * Add feed button with size
		 * 
		 * @param x_coord the x coordinate of the view position
		 * @param y_coord the y coordinate of the view position 
		 * @param button_size button new size
		 */
		public function addFeedButtonWithSize(x_coord:Number,y_coord:Number,button_size:Number):void {
			if(extContext != null) {
				extContext.call("addFeedButtonWithSize",x_coord,y_coord,button_size);
			}			
		}
		
		/**
		 * Show feed view on screen
		 */
		public function showFeedView():void {
			if(extContext != null) {
				extContext.call("showFeedView");
			}			
		}	
		
		/**
		 * Dismiss feed view
		 */
		public function dismissFeedView():void {
			if(extContext != null) {
				extContext.call("dismissFeedView");
			}			
		}
		
		 
		/**
		 * Add feed panel view to screen
		 * 
		 * @param panel_type panel type (TOP,BOTTOM,RIGHT,LEFT)
		 * @param handle_position handle position (CENTER,START,STOP)
		 * @param isFamily set for family compatibale panel
		 */
		public function addPanleView(panel_type:Number,handle_position:Number,isFamily:Boolean):void {
			if(extContext != null) {
				extContext.call("addPanelView",panel_type,handle_position,isFamily);
			}			
		}
		
		/**
		 * Set panl view color in hexa representation 
		 * 
		 * @param color_hexa color in hexa representation (Example : "#ffffff")
		 */
		public function setPanelViewColor(color_hexa:String):void {
			extContext.call("setPanelViewColor",color_hexa);
		}
			
		
		/**
		 * Change panel visibility state
		 * 
		 */
		public function changePanelVisivilityState(visible:Boolean):void {
			if(extContext != null) {
				extContext.call("changePanelVisibility",visible);
			}			
		}
 
		/**
		 * Change feed button visibility state
		 */
		public function changeFeedButtonVisivilityState(visible:Boolean):void {
			if(extContext != null) {
				extContext.call("changeFeedButtonVisibility",visible);
			}			
		}
		
		/**
		 * Collapse panel view
		 */
		public function collapsePanelView():void {
			if(extContext != null) {
				extContext.call("collapsePanelView");
			}			
		}
		
		/**
		 * Expand panel view
		 */
		public function expandPanelView():void {
			if(extContext != null) {
				extContext.call("expandPanelView");
			}			
		}
		
		/**
		 * Expand panel view
		 */
		public function isPanelExpanded():Boolean {
			if(extContext != null) {
				return extContext.call("isPanelExpanded");
			}else {
				return false;
			}
		}
	 	
		/**
		 * Set on panel view event listener
		 * 
		 * @param listener class that implemets "IPanelViewInterface" interface
		 */
		public function setOnPanelViewEventListener(listener:IPanelViewInterface):void {
			mPanelViewListener = listener;
		}
		
		/**
		 * Set on feed view event listener
		 * 
		 * @param listener class that implemets "IFeedViewIntefrace" interface 
		 */
		public function setOnFeedViewEventListener(listener:IFeedViewIntefrace):void {
			mFeedViewListener = listener;
		}
		
		/**
		 * Cleans up the instance of the native extension. 
		 */		
		public function dispose():void { 
			extContext.dispose(); 
		}
			
		/**
		 * Print function for debuging purposes
		 * 
		 * @text some thext to print
		 */		
		public function printToastDebugLog(text:String):void {
			extContext.call("printToastLog",text);
		}
	}	
}

internal class SingletonEnforcer { }

