package openfl.gui.engines;
import openfl.display.DisplayObjectContainer;
import openfl.display.DisplayObject;
import openfl.geom.Rectangle;
import openfl.display.Stage;
import openfl.gui.Control;

//TODO
class LayoutEngine
{

	private static var _totalTopHeight:Float;
	private static var _totalRightWidth:Float;
	private static var _totalLeftWidth:Float;
	private static var _totalBottomHeight:Float;
	private static var __previousContainer:DisplayObjectContainer;
	private static var __currentContainer:DisplayObjectContainer;
	
	private static var __backBuffer:Array<DisplayObject> = [];
	
	public static var formingOrder:Array<Int> = [];
	
	public static function generateLayout(stage:Stage)
	{
		for (i in 0...stage.numChildren)
		{
			if (Std.is(stage.getChildAt(i), Control))
				dockControl(cast (stage.getChildAt(i), Control));
		}
		
		__currentContainer = null;
		__previousContainer = null;
	}
	
	public static function dockControl(control:Control)
	{
		__currentContainer = control.parent;
		if (__previousContainer != null)
		{
			if (__previousContainer != __currentContainer)
			{
				_totalTopHeight = 0;
				_totalRightWidth = 0;
				_totalLeftWidth = 0;
				_totalBottomHeight = 0;
				_dockControlInContainer(control, __currentContainer);
			}
			else
			{
				_dockControlInContainer(control, __previousContainer);
			}
		}
		else
		{
			_dockControlInContainer(control, __currentContainer);
		}
		
		__previousContainer = __currentContainer;
	}
	
	private static function _dockControlInContainer(control:Control, container:DisplayObjectContainer)
	{
		for (i in 0...container.numChildren)
		{
			if (Std.is(container.getChildAt(i), Control))
			{
				var casted = cast (container.getChildAt(i), Control);
				if (casted.dock == Control.DOCK_TOP)
				{
					
				}
				
			}
		}
	}
	
}