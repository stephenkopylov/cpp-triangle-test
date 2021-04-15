//
//  Triangle.cpp
//  cpp-triangle-test
//
//  Created by Stepan Kopylov on 15/04/2021.
//

#include "Triangle.hpp"
#include "nvg/nanovg_gl.h"
#include "nvg/nanovg_gl_utils.h"

void Triangle::draw(float w, float h, float scale){
	if(!nanovgInitialized){
		vg = nvgCreateGLES2(NVG_ANTIALIAS | NVG_STENCIL_STROKES);
		nanovgInitialized = true;
	}
	
	nvgBeginFrame(vg, w, h, 3);
	
	NVGcolor color = nvgRGB(0.0, 255, 0.0);
	
	nvgBeginPath(vg);
	nvgMoveTo(vg, 0.0, 0.0);
	nvgLineTo(vg, 100.0, 0.0);
	nvgLineTo(vg, 100.0, 100.0);
	nvgLineTo(vg, 0.0, 100.0);
	nvgLineTo(vg, 0.0, 0.0);
	nvgClosePath(vg);
	nvgFillColor(vg, color);
	nvgFill(vg);
	
	nvgEndFrame(vg);
}
