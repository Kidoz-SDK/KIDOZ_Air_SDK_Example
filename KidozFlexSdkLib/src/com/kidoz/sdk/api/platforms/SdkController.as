package com.kidoz.sdk.api.platforms
{
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	/**
	 * Sdk Controller Version 0.6.0
	 * */
	public class SdkController  extends EventDispatcher
	{
		private static const FK_INIT_SDK:String = "initSdk";
		private static const FK_ADD_FEED_BUTTON:String = "addFeedButton";
		private static const FK_ADD_FEED_BUTTON_WITH_SIZE:String = "addFeedButtonWithSize";
		private static const FK_SHOW_FEED_VIEW:String = "showFeedView";
		private static const FK_DISMISS_FEED_VIEW:String = "dismissFeedView";
		private static const FK_ADD_PANEL:String = "addPanelView";
		private static const FK_CHANGE_FEED_VISIBILITY:String = "changeFeedButtonVisibility";
		private static const FK_CHANGE_PANEL_VISIBILITY:String = "changePanelVisibility";
		private static const FK_COLLAPSE_PANEL:String = "collapsePanelView";
		private static const FK_EXPAND_PANEL:String = "expandPanelView";
		private static const FK_SET_PANEL_VIEW_COLOR:String = "setPanelViewColor";
		private static const FK_IS_PANEL_EXPANDED:String = "isPanelExpanded";
		private static const FK_ADD_BANNER_VIEW:String = "addBannerView";
		private static const FK_ADD_BANNER_VIEW_EXTENDED:String = "addBannerViewExtended";
		private static const FK_CHANGE_BANNER_POSITION:String = "changeBannerPosition";
		private static const FK_SHOW_BANNER_VIEW:String = "showBannerView";
		private static const FK_HIDE_BANNER_VIEW:String = "hideBannerView";
		private static const FK_ADD_FLEXI_VIEW:String = "addFlexiView";
		private static const FK_SHOW_FLEXI_VIEW:String = "showFlexiView";
		private static const FK_HIDE_FLEXI_VIEW:String = "hideFlexiView";
		private static const FK_GET_IS_FLEXI_VIEW_VISIBLE:String = "getIsFlexiViewVisible";
	 
		//interstitial native calls
		private static const FK_SHOW_INTERSTITIAL:String = "showInterstitial";
		private static const FK_LOAD_INTERSTITIAL:String = "loadInterstitial";
		private static const FK_IS_INTERSTITIAL_LOADED:String = "isInterstitialLoaded";
		
		//rewarded native calls
		private static const FK_SHOW_REWARDED:String = "showRewarded";
		private static const FK_LOAD_REWARDED:String = "loadRewarded";
		private static const FK_IS_REWARDED_LOADED:String = "isRewardedLoaded";
	
		
		private static const FK_SHOW_VIDEO_UNIT:String = "showVideoUnit";
		private static const FK_PRINT_TOAST_LOG:String = "printToastLog";
		
		// Panel Types
		public static const PANEL_TYPE_BOTTOM:int = 0; 
		public static const PANEL_TYPE_TOP:int = 1; 		
		public static const PANEL_TYPE_LEFT:int = 2; 
		public static const PANEL_TYPE_RIGHT:int = 3;
		
		// Panel Handle Positions
		public static const HANDLE_POSITION_START:int = 0;
		public static const HANDLE_POSITION_CENTER:int = 1;
		public static const HANDLE_POSITION_END:int = 2;
		
		// Banner Anchor Position
		public static const BANNER_POSITION_TOP:int = 0; 
		public static const BANNER_POSITION_BOTTOM:int = 1; 
		public static const BANNER_POSITION_TOP_LEFT:int = 2; 	
		public static const BANNER_POSITION_TOP_RIGHT:int = 3; 		
		public static const BANNER_POSITION_BOTTOM_LEFT:int = 4; 		
		public static const BANNER_POSITION_BOTTOM_RIGHT:int = 5; 	
		
		// Flexi View Anchor Position
		public static const FLEXI_VIEW_POSITION_TOP_START:int = 0; 
		public static const FLEXI_VIEW_POSITION_TOP_CENTER:int = 1; 
		public static const FLEXI_VIEW_POSITION_TOP_END:int = 2; 	
		public static const FLEXI_VIEW_POSITION_MID_START:int = 3; 		
		public static const FLEXI_VIEW_POSITION_MID_CENTER:int = 4; 		
		public static const FLEXI_VIEW_POSITION_MID_END:int = 5; 
		public static const FLEXI_VIEW_POSITION_BOTTOM_START:int = 6; 		
		public static const FLEXI_VIEW_POSITION_BOTTOM_CENTER:int = 7; 		
		public static const FLEXI_VIEW_POSITION_BOTTOM_END:int = 8;
		
		//-------------------------------------------------		
		private static var instance:SdkController;
		private static var extContext:ExtensionContext = null;	
		private static var mPublisher_id:String;
		private static var mToken:String;		
		private var mFeedViewListener:IFeedViewIntefrace = null;
		private var mPanelViewListener:IPanelViewInterface = null;
		private var mBannerViewListener:IBannerViewInterface = null;
		private var mFlexiViewListener:IFlexiViewInterface = null;
		private var mGeneralEventListener:IGeneralEventInterface = null;
		private var mInterstitialEventListener:IInterstitialEventInterface = null;
		private var mRewardedEventListener:IRewardedEventInterface = null;
		private var mVideoUnitEventListener:IVideoUnitInterface = null;
		
		// Used for Panel interface listener
		private static const PANEL_VIEW_EVENT:String = "PANEL_VIEW_EVENT"; 
		private static const PANEL_VIEW_EVENT_EXPANDED:String = "PANEL_VIEW_EVENT_EXPANDED";
		private static const PANEL_VIEW_EVENT_COLLAPSED:String = "PANEL_VIEW_EVENT_COLLAPSED";
		private static const PANEL_VIEW_EVENT_PANEL_READY:String = "PANEL_VIEW_EVENT_PANEL_READY";
		
		// Used for Feed interface listener
		private static const FEED_VIEW_EVENT:String = "FEED_VIEW_EVENT"; 
		private static const FEED_VIEW_EVENT_READY_TOSHOW:String = "FEED_VIEW_EVENT_READY_TOSHOW"; 
		private static const FEED_VIEW_EVENT_DISMISS:String = "FEED_VIEW_EVENT_DISMISS"; 
		private static const FEED_VIEW_EVENT_OBJECT_READY:String = "FEED_VIEW_EVENT_OBJECT_READY"; 
		
		// Used for Banner interface listener
		private static const BANNER_VIEW_EVENT:String = "BANNER_VIEW_EVENT";
		private static const BANNER_VIEW_EVENT_READY:String = "BANNER_VIEW_EVENT_READY"; 
		private static const BANNER_VIEW_EVENT_SHOW:String = "BANNER_VIEW_EVENT_SHOW"; 
		private static const BANNER_VIEW_EVENT_HIDE:String = "BANNER_VIEW_EVENT_HIDE"; 
		private static const BANNER_VIEW_EVENT_CONTENT_LOADED:String = "BANNER_VIEW_EVENT_CONTENT_LOADED"; 
		private static const BANNER_VIEW_EVENT_CONTENT_LOAD_FAILED:String = "BANNER_VIEW_EVENT_CONTENT_LOAD_FAILED"; 
		
		// Used for Flexi view interface listener
		private static const FLEXI_VIEW_EVENT:String = "FLEXI_VIEW_EVENT";
		private static const FLEXI_VIEW_EVENT_READY:String = "FLEXI_VIEW_EVENT_READY"; 
		private static const FLEXI_VIEW_EVENT_VISIBLE:String = "FLEXI_VIEW_EVENT_VISIBLE"; 
		private static const FLEXI_VIEW_EVENT_HIDDEN:String = "FLEXI_VIEW_EVENT_HIDDEN"; 
		
		// General events interface listener
		private static const GENERAL_VIEW_EVENT:String = "GENERAL_VIEW_EVENT"; 
		private static const PLAYER_EVENT_OPEN:String = "PLAYER_EVENT_OPEN";
		private static const PLAYER_EVENT_CLOSE:String = "PLAYER_EVENT_CLOSE";
		
		// Intesrtitial events interface listener
		private static const INTERSTITIAL_VIEW_EVENT:String = "INTERSTITIAL_VIEW_EVENT";
		private static const INTERSTITIAL_EVENT_OPENED:String = "INTERSTITIAL_EVENT_OPENED";
		private static const INTERSTITIAL_EVENT_CLOSED:String = "INTERSTITIAL_EVENT_CLOSED";
		private static const INTERSTITIAL_EVENT_READY:String = "INTERSTITIAL_EVENT_READY";
		private static const INTERSTITIAL_EVENT_LOAD_FAILED:String = "INTERSTITIAL_EVENT_LOAD_FAILED";
		private static const INTERSTITIAL_EVENT_NO_OFFERS:String = "INTERSTITIAL_EVENT_NO_OFFERS";
		
		// Rewarded events interface listener
		private static const REWARDED_VIEW_EVENT:String = "REWARDED_VIEW_EVENT";
		private static const REWARDED_EVENT_OPENED:String = "REWARDED_EVENT_OPENED";
		private static const REWARDED_EVENT_CLOSED:String = "REWARDED_EVENT_CLOSED";
		private static const REWARDED_EVENT_READY:String = "REWARDED_EVENT_READY";
		private static const REWARDED_EVENT_LOAD_FAILED:String = "REWARDED_EVENT_LOAD_FAILED";
		private static const REWARDED_EVENT_REWARDED:String = "REWARDED_EVENT_REWARDED";
		private static const REWARDED_EVENT_REWARDED_VIDEO_STARTED:String = "REWARDED_EVENT_REWARDED_VIDEO_STARTED";
		private static const REWARDED_EVENT_NO_OFFERS:String = "REWARDED_EVENT_NO_OFFERS";
		
	
		// Video Unit Events
		private static const VIDEO_UNIT_EVENT:String = "VIDEO_UNIT_EVENT";
		private static const VIDEO_UNIT_EVENT_OPEN:String = "VIDEO_UNIT_EVENT_OPEN";
		private static const VIDEO_UNIT_EVENT_CLOSE:String = "VIDEO_UNIT_EVENT_CLOSE";
		private static const VIDEO_UNIT_EVENT_READY:String = "VIDEO_UNIT_EVENT_READY";
		 
		
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
					extContext.call(FK_INIT_SDK,publisher_id,token);
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
			}else if(event.code == BANNER_VIEW_EVENT){	
				if(mBannerViewListener) {
					if(event.level == BANNER_VIEW_EVENT_SHOW) {
						mBannerViewListener.onBannerShow();
					}else if(event.level == BANNER_VIEW_EVENT_HIDE){
						mBannerViewListener.onBannerHide();
					}else if(event.level == BANNER_VIEW_EVENT_READY){
						mBannerViewListener.onBannerReady();
					}else if(event.level == BANNER_VIEW_EVENT_CONTENT_LOADED){
						mBannerViewListener.onBannerContentLoaded();
					}else if(event.level == BANNER_VIEW_EVENT_CONTENT_LOAD_FAILED){
						mBannerViewListener.onBannerContentLoadFailed();
					}	
				}
			}
			else if(event.code == FLEXI_VIEW_EVENT){	
				if(mFlexiViewListener) {
					if(event.level == FLEXI_VIEW_EVENT_READY) {
						mFlexiViewListener.onFlexiViewReady();
					}else if(event.level == FLEXI_VIEW_EVENT_VISIBLE){
						mFlexiViewListener.onFlexiViewVisible();
					}else if(event.level == FLEXI_VIEW_EVENT_HIDDEN){
						mFlexiViewListener.onFlexiViewHidden();
					}
				}
			}
			else if(event.code == GENERAL_VIEW_EVENT){	
				if(mGeneralEventListener) {
					if(event.level == PLAYER_EVENT_OPEN) {
						mGeneralEventListener.onPlayerOpened();
					}else if(event.level == PLAYER_EVENT_CLOSE){
						mGeneralEventListener.onPlayerClosed();
					}
				}
			}
			else if(event.code == INTERSTITIAL_VIEW_EVENT){	
				if(mInterstitialEventListener) {
					if(event.level == INTERSTITIAL_EVENT_OPENED) {
						mInterstitialEventListener.onOpened();
					}else if(event.level == INTERSTITIAL_EVENT_CLOSED){
						mInterstitialEventListener.onClosed();
					}else if(event.level == INTERSTITIAL_EVENT_READY){
						mInterstitialEventListener.onReady();
					}else if(event.level == INTERSTITIAL_EVENT_LOAD_FAILED){
						mInterstitialEventListener.onLoadFailed();
					}else if(event.level == INTERSTITIAL_EVENT_NO_OFFERS){
						mInterstitialEventListener.onInterstitialNoOffers();
					}						 
				}
			}
			else if(event.code == REWARDED_VIEW_EVENT){
				if(event.level == REWARDED_EVENT_OPENED) {
					mRewardedEventListener.onOpened();
				}else if(event.level == REWARDED_EVENT_CLOSED){
					mRewardedEventListener.onClosed();
				}else if(event.level == REWARDED_EVENT_READY){
					mRewardedEventListener.onReady();
				}else if(event.level == REWARDED_EVENT_LOAD_FAILED){
					mRewardedEventListener.onLoadFailed();
				}	else if(event.level == REWARDED_EVENT_LOAD_FAILED){
					mRewardedEventListener.onRewarded();
				}else if(event.level == REWARDED_EVENT_LOAD_FAILED){
					mRewardedEventListener.onRewardedVideoStarted();
				}else if(event.level == REWARDED_EVENT_NO_OFFERS){
					mRewardedEventListener.onRewardedNoOffers();
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
				extContext.call(FK_ADD_FEED_BUTTON,x_coord,y_coord);
			}			
		}
		
		
		/**
		 * Add feed button with size
		 * 
		 * @param x_coord the x coordinate of the view position
		 * @param y_coord the y coordinate of the view position 
		 * 
		 * @param (DEPRECATED) button_size button new size
		 */
		public function addFeedButtonWithSize(x_coord:Number,y_coord:Number,button_size:Number):void {
			if(extContext != null) {
				extContext.call(FK_ADD_FEED_BUTTON_WITH_SIZE,x_coord,y_coord,-1);
			}			
		}
		
		/**
		 * Show feed view on screen
		 */
		public function showFeedView():void {
			if(extContext != null) {
				extContext.call(FK_SHOW_FEED_VIEW);
			}			
		}	
		
		/**
		 * Dismiss feed view
		 */
		public function dismissFeedView():void {
			if(extContext != null) {
				extContext.call(FK_DISMISS_FEED_VIEW);
			}			
		}
		
		/**
		 * Add feed panel view to screen
		 * 
		 * @param panel_type panel type (TOP,BOTTOM,RIGHT,LEFT)
		 * @param handle_position handle position (CENTER,START,STOP)
		 */
		public function addPanleView(panel_type:Number,handle_position:Number):void {
			if(extContext != null) {
				extContext.call(FK_ADD_PANEL,panel_type,handle_position,true,-1,-1);
			}			
		}
		
		
		/**
		 * Add panel view to screen with additional properties
		 * 
		 * @param panel_type panel type (TOP,BOTTOM,RIGHT,LEFT)
		 * @param handle_position handle position (CENTER,START,STOP)
		 * @param autoVisible     make panel visible on prepared and ready
		 * 
		 * @param (DEPRECATED) startDelay delay in seconds before automatic invocation of panel expand , pass -1 to  disable
		 * @param  (DEPRECATED) showPeriod period in seconds to show the panel before closing it, pass -1 to  disable
		 */
		public function addPanleViewExtended(panel_type:Number,handle_position:Number,autoVisible:Boolean,starDelay:Number,showPeriod:Number):void {
			if(extContext != null) {
				extContext.call(FK_ADD_PANEL,panel_type,handle_position,autoVisible,-1,-1);
			}			
		}
		
		
		/**
		 * @Deprecated  Will be remived in the future releases
		 * Set panel view color in hexa representation 
		 * 
		 * @param color_hexa color in hexa representation (Example : "#ffffff")
		 */
		public function setPanelViewColor(color_hexa:String):void {
			 
		}
		
		
		/**
		 * Change panel visibility state
		 * 
		 * @param visible
		 */
		public function changePanelVisibilityState(visible:Boolean):void {
			if(extContext != null) {
				extContext.call(FK_CHANGE_PANEL_VISIBILITY,visible);
			}			
		}
		
		/**
		 * Change feed button visibility state
		 * 
		 * @param visible
		 */
		public function changeFeedButtonVisibilityState(visible:Boolean):void {
			if(extContext != null) {
				extContext.call(FK_CHANGE_FEED_VISIBILITY,visible);
			}			
		}
		
		/**
		 * Collapse panel view
		 */
		public function collapsePanelView():void {
			if(extContext != null) {
				extContext.call(FK_COLLAPSE_PANEL);
			}			
		}
		
		/**
		 * Expand panel view
		 */
		public function expandPanelView():void {
			if(extContext != null) {
				extContext.call(FK_EXPAND_PANEL);
			}			
		}
		
		/**
		 * Get panel view current state (Expanded/Collapsed)
		 * 
		 * @return if panel expanded or not
		 */
		public function isPanelExpanded():Boolean {
			if(extContext != null) {
				return extContext.call(FK_IS_PANEL_EXPANDED);
			}else {
				return false;
				
			}
		}
		
		
		/**
		 * @Deprecated  Will be remived in the future releases
		 * Add Banner view to screen  
		 * 
		 * @param banner_anchor_pos banner anchor position on screen (BANNER_POSITION...)
		 */
		public function addBannerView(banner_anchor_pos:Number):void {
			  
		}
		
		/**
		 * @Deprecated  Will be remived in the future releases
		 * 
		 * Add Banner view to screen
		 * 
		 * @param banner_anchor_pos banner anchor position on screen (BANNER_POSITION...)
		 * @param auto_show is auto show banner on ready
		 */
		public function addBannerViewExtended(banner_anchor_pos:Number,auto_show:Boolean):void {
			 
		}
		
		
		/**
		 * @Deprecated  Will be remived in the future releases
		 * 
		 * Change Banner view anchor position on screen
		 * 
		 * @param banner_anchor_pos banner anchor position on screen (BANNER_POSITION...)
		 */
		public function changeBannerViewPosition(banner_anchor_pos:Number):void {
			 
		}	
		
		/**
		 * @Deprecated  Will be remived in the future releases
		 * 
		 * Show banner view		 
		 */
		public function showBannerView():void {
			 
		}
		
		/**
		 * @Deprecated  Will be remived in the future releases
		 * 
		 * Hide banner view		 
		 */
		public function hideBannerView():void {
			 
		}
		
		/**
		 * Add Flexi point view to screen
		 * 
		 * @param isAutoShow notify if to show the flexi view right away when its ready 
		 * @param initial_pos the initial position of the flexi view on screen (FLEXI_VIEW_POSITION_TOP_START... )
		 */
		public function addFlexiView(isAutoShow:Boolean,initial_pos:Number):void {
			if(extContext != null) {
				extContext.call(FK_ADD_FLEXI_VIEW,isAutoShow,initial_pos);
			} 
		}
		
		/**
		 * Show and make visible flexi view on screen
		 */
		public function showFlexiView():void {
			if(extContext != null) {
				extContext.call(FK_SHOW_FLEXI_VIEW);
			} 
		}
		
		/**
		 * Hide and make invisible flexi point view 
		 */
		public function hideFlexiView():void {
			if(extContext != null) {
				extContext.call(FK_HIDE_FLEXI_VIEW);
			} 
		}
		
		/**
		 * Get is felxi view currently visible
		 */
		public function getIsFlexiViewVisible():Boolean {
			if(extContext != null) {
				return extContext.call(FK_GET_IS_FLEXI_VIEW_VISIBLE);
			}else {
				return false;
			}
		}
		
		/**
		 * @Deprecated  Will be remived in the future releases
		 * Set is felxi view can be draggable
		 * 
		 * @param is draggable
		 */
		public function setFlexiViewDraggable(draggable:Boolean):void {
			 
		}	
		
		/**
		 * @Deprecated  Will be remived in the future releases
		 * Set is felxi view can be closable
		 * 
		 * @param closable set is closable
		 */
		public function setFlexiViewClosable(closable:Boolean):void {
			
		}		
		
		/****************
		 * Interstitial *
		 ****************/
		
		/**
		 * Show interstitial view		 
		 */
		public function showInterstitialView():void {
			if(extContext != null) {
				extContext.call(FK_SHOW_INTERSTITIAL);
			}
		}	
		
		
		/**
		 * Load and preapre interstitial view ad
		 * (This function also used for reloading the ad)
		 * 
		 * @param auto_show is auto show interstitial on ready
		 */
		public function loadInterstitialView(auto_show:Boolean):void {
			if(extContext != null) {
				extContext.call(FK_LOAD_INTERSTITIAL,auto_show);
			}
		}	
		
		
		/**
		 * Get is interstitial ad is loaded and ready
		 * 
		 * @return loaded state
		 */
		public function getIsInterstitialLoaded():Boolean {
			if(extContext != null) {
				return extContext.call(FK_IS_INTERSTITIAL_LOADED);
			}else {
				return false;
			}
		}	
		
		/************
		 * Rewarded *
		 ************/
		
		/**
		 * Show Rewarded view		 
		 */
		public function showRewardedView():void {
			if(extContext != null) {
				extContext.call(FK_SHOW_REWARDED);
			}
		}	
		
		/**
		 * Load and preapre Rewarded view ad
		 * (This function also used for reloading the ad)
		 * 
		 * @param auto_show is auto show Rewarded on ready
		 */
		public function loadRewardedView(auto_show:Boolean):void {
			if(extContext != null) {
				extContext.call(FK_LOAD_REWARDED,auto_show);
			}
		}	
		
		
		/**
		 * Get is Rewarded ad is loaded and ready
		 * 
		 * @return loaded state
		 */
		public function getIsRewardedLoaded():Boolean {
			if(extContext != null) {
				return extContext.call(FK_IS_REWARDED_LOADED);
			}else {
				return false;
			}
		}	
		
		/*************
		 * VideoUnit *
		 *************/
		
		/**
		 * Show video unit view
		 * 
		 * @return loaded state
		 */
		public function showVideoUnit():void {
			if(extContext != null) {
				extContext.call(FK_SHOW_VIDEO_UNIT);
			} 
		}	
		
		
		/**
		 * Set on panel view event listener
		 * 
		 * @param listener class that implements "IPanelViewInterface" interface
		 */
		public function setOnPanelViewEventListener(listener:IPanelViewInterface):void {
			mPanelViewListener = listener;
		}
		
		/**
		 * Set on feed view event listener
		 * 
		 * @param listener class that implements "IFeedViewIntefrace" interface 
		 */
		public function setOnFeedViewEventListener(listener:IFeedViewIntefrace):void {
			mFeedViewListener = listener;
		}
		
		/**
		 * @Deprecated  Will be remived in the future releases
		 * 
		 * Set on Banner view event listener
		 * 
		 * @param listener class that implements "IBannerViewInterface" interface 
		 */
		public function setOnBannerViewEventListener(listener:IBannerViewInterface):void {
			mBannerViewListener = listener;
		}
		
		
		/**
		 * Set on Flexi view event listener
		 * 
		 * @param listener class that implements "IFlexiViewInterface" interface 
		 */
		public function setOnFlexiViewEventListener(listener:IFlexiViewInterface):void {
			mFlexiViewListener = listener;
		}
		
		/**
		 * Set on General event listener
		 * Used to catch sdk general event (Player opened,Player closed)
		 * 
		 * @param listener class that implements "IGeneralEventInterface" interface 
		 */
		public function setOnGeneralEventListener(listener:IGeneralEventInterface):void {
			mGeneralEventListener = listener;
		}	
		
		/**
		 * Set on Interstitial event listener
		 * 
		 * @param listener class that implements "IInterstitialEventInterface" interface 
		 */
		public function setOnInterstitialEventListener(listener:IInterstitialEventInterface):void {
			mInterstitialEventListener = listener;
		}	
		
		/**
		 * Set on Rewarded event listener
		 * 
		 * @param listener class that implements "IRewardedEventInterface" interface 
		 */
		public function setOnRewardedEventListener(listener:IRewardedEventInterface):void {
			mRewardedEventListener = listener;
		}	
		
		/**
		 * Set on video unit event listener
		 * 
		 * @param listener class that implements "IVideoUnitInterface" interface 
		 */
		public function setOnVideoUnitEventListener(listener:IVideoUnitInterface):void {
			mVideoUnitEventListener = listener;
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
			extContext.call(FK_PRINT_TOAST_LOG,text);
		}
	}	
}

internal class SingletonEnforcer { }

