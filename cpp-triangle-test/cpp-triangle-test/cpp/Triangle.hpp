//
//  Triangle.hpp
//  cpp-triangle-test
//
//  Created by Stepan Kopylov on 15/04/2021.
//

#ifndef Triangle_hpp
#define Triangle_hpp

#include <stdio.h>

#define NANOVG_GLES2_IMPLEMENTATION

#ifdef __APPLE__
#include "OpenGLES/ES2/glext.h"
#elif __ANDROID__
#include <GLES2/gl2.h>
#endif

#include "nvg/nanovg.h"

class Triangle{
public:
	void draw(float w, float h, float scale);
private:
	bool nanovgInitialized = false;
	NVGcontext* vg;
};

#endif /* Triangle_hpp */