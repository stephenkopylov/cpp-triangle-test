//
//  Triangle.cpp
//  cpp-triangle-test
//
//  Created by Stepan Kopylov on 15/04/2021.
//

#include "Triangle.hpp"
#include "nvg/nanovg_gl.h"
#include "nvg/nanovg_gl_utils.h"

#define TRIANGLE_HEIGHT 100
#define TRIANGLE_WIDTH 120

void Triangle::draw(float w, float h, float scale, float angle){
	if(!nanovgInitialized){
		vg = nvgCreateGLES2(NVG_ANTIALIAS | NVG_STENCIL_STROKES);
		nanovgInitialized = true;
	}

	nvgBeginFrame(vg, w, h, 3);
	
	nvgSave(vg);
	
	float centerX, centerY;
	centerX = w/2.f;
	centerY = h/2.f;
	
	nvgTranslate(vg, centerX, centerY);
	nvgRotate(vg, degreesToRadians(angle));
	nvgTranslate(vg, -centerX, -centerY);
	
	nvgBeginPath(vg);
	nvgMoveTo(vg, centerX, centerY-TRIANGLE_HEIGHT/2);
	nvgLineTo(vg, centerX+TRIANGLE_WIDTH/2, centerY+TRIANGLE_HEIGHT/2);
	nvgLineTo(vg, centerX-TRIANGLE_WIDTH/2, centerY+TRIANGLE_HEIGHT/2);
	nvgLineTo(vg, centerX, centerY-TRIANGLE_HEIGHT/2);
	nvgClosePath(vg);
	
	NVGcolor color = nvgRGB(0.0, 255, 0.0);
	nvgFillColor(vg, color);
	nvgFill(vg);
	
	nvgEndFrame(vg);
	
	nvgRestore(vg);
	
	if(radCallback){
		radCallback(degreesToRadians(angle));
	}
}

void Triangle::setRadCallback(RadCallback cRadCallback){
	radCallback = cRadCallback;
}

double Triangle::degreesToRadians(double degree)
{
	double pi = 3.14159265359;
	return (degree * (pi / 180));
}
