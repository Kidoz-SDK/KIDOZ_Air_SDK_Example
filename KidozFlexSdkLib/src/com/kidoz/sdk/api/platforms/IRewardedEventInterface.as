package com.kidoz.sdk.api.platforms
{
	public interface IRewardedEventInterface
	{
		function onOpened():void; 
		function onClosed():void;	 
		function onReady():void;
		function onLoadFailed():void;
		function onRewarded():void;
		function onRewardedVideoStarted():void;
		function onRewardedNoOffers():void;
	}
}