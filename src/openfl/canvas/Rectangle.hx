/*
The MIT License (MIT)

Copyright (c) 2015 tienery and other contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

package openfl.canvas;
import openfl.display.BitmapData;
import openfl.display.GradientType;
import openfl.display.Graphics;
import openfl.display.InterpolationMethod;
import openfl.display.LineScaleMode;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.SpreadMethod;
import openfl.geom.Point;
import openfl.geom.Matrix;

class Rectangle extends Object
{
	
	private var _topLeftRadius:Float;
	/**
	 * Gets or sets a value indicating the top-left radius of this rectangle. If this is greater than 0, and
	 * all other radiuses are not, the value of this radius will apply to all other radiuses. If not, then
	 * each radius will keep its own value. If neither radius is greater than 0, the resulting rectangle
	 * is one with only flat corners.
	 */
	public var topLeftRadius(get, set):Float;
	function get_topLeftRadius() return _topLeftRadius;
	function set_topLeftRadius(val) return _topLeftRadius = val;
	
	private var _topRightRadius:Float;
	/**
	 * Gets or sets a value indicating the top-right radius of this rectangle.
	 */
	public var topRightRadius(get, set):Float;
	function get_topRightRadius() return _topRightRadius;
	function set_topRightRadius(val) return _topRightRadius = val;
	
	private var _bottomLeftRadius:Float;
	/**
	 * Gets or sets a value indicating the bottom-left radius of this rectangle.
	 */
	public var bottomLeftRadius(get, set):Float;
	function get_bottomLeftRadius() return _bottomLeftRadius;
	function set_bottomLeftRadius(val) return _bottomLeftRadius = val;
	
	private var _bottomRightRadius:Float;
	/**
	 * Gets or sets a value indicating the bottom-right radius of this rectangle.
	 */
	public var bottomRightRadius(get, set):Float;
	function get_bottomRightRadius() return _bottomRightRadius;
	function set_bottomRightRadius(val) return _bottomRightRadius = val;
	
	/**
	 * Creates a new `Rectangle` with the given position and size. If a `styleName` is given, that style within a
	 * previously parsed JSON-formatted file will be used to format this rectangle.
	 * @param	x			The position of this rectangle along the x-axis.
	 * @param	y			The position of this rectangle along the y-axis.
	 * @param	width		The size of this rectangle's width.
	 * @param	height		The size of this rectangle's height.
	 * @param	styleName	The name of the style used to apply styling to this object.
	 */
	public function new(x:Float, y:Float, width:Float, height:Float, styleName:String = "") 
	{
		super(styleName);
		
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}
	
	/**
	 * This function is used with a graphics component to draw the rectangle, in addition to any styling this rectangle
	 * have. By default, all default styling variables will be used.
	 * @param	g			The graphics component to use when drawing this rectangle.
	 * @param	applyFill	A value indicating whether or not to apply fill stying to this rectangle.
	 */
	public override function draw(g:Graphics, applyFill:Bool = false)
	{
		super.draw(g, applyFill);
		
		if (topLeftRadius > 0 && topRightRadius > 0 && bottomLeftRadius > 0 && bottomRightRadius > 0)
			g.drawRoundRectComplex(x, y, width, height, topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
		else if (topLeftRadius > 0 || topRightRadius > 0 || bottomLeftRadius > 0 || bottomRightRadius > 0)
		{
			topRightRadius = bottomLeftRadius = bottomRightRadius = topLeftRadius;
			g.drawRoundRectComplex(x, y, width, height, topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
		}
		else
		{
			g.drawRect(x, y, width, height);
		}
	}
	
	/**
	 * Resets all radius properties to 0.
	 */
	public function resetRadiuses()
	{
		topLeftRadius = topRightRadius = bottomLeftRadius = bottomRightRadius = 0;
	}
	
}