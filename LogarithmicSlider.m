//
//  LogarithmicSlider.m
//
//  Created by Matt Kane on 19/01/2012.
//  Copyright (c) 2012 Matt Kane. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//  of the Software, and to permit persons to whom the Software is furnished to do
//  so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "LogarithmicSlider.h"

@implementation LogarithmicSlider
@dynamic sliderValue;

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    float val =  self.value;
    
    self->_maximumValue = super.maximumValue;
    super.maximumValue = logf(self->_maximumValue);
    
    self->_minimumValue = super.minimumValue;
    super.minimumValue = logf(self->_minimumValue);
    
    self.sliderValue = val;

    
    return self;
}

-(void)setSliderValue:(float)value animated:(BOOL)animated
{
    [self setValue:logf(value) animated:animated];

}

-(void)setSliderValue:(float)value
{
    [self setSliderValue:value animated:NO];
}


-(float)sliderValue
{
//    This works around rounding errors.
    if(super.value == super.maximumValue) {
        return self->_maximumValue;
    }
    if(super.value == super.minimumValue) {
        return self->_minimumValue;
    }

    return expf(super.value);
}

@end
