package com.kidoz.sdk.api.platforms
{
	public interface IBannerViewInterface
	{
		function onBannerReady():void; 
		function onBannerShow():void;
		function onBannerHide():void;
		function onBannerContentLoaded():void;
		function onBannerContentLoadFailed():void;		
	}
}