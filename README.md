## Logarithmic Slider
### Logarithmic UISlider subclass 

There are lots of cases where I've found myself needing sliders with finer control at the low end than at the high end. Examples include time duration, with milliseconds going all the way up to days. The best way to do this is with a logarithmic scale. This UISlider subclass for iOS implements this, with a base e scale.

### Usage

Add the files to your project and include `LogarithmicSlider.h` in your view controller header. Add a normal UISlider in Interface Builder. In the Identity Inspector, change the custom class to _LogarithmicSlider_. Set the minimum, maximum and default values in the Attributes Inspector as normal. 

#### IMPORTANT
You shouldn't use the `slider.value` or `[slider setValue:animated:]` methods. Instead use the `slider.sliderValue` and `[slider setSliderValue:animated:]` variants to get and set the value of the slider. 

### LICENCE
© Copyright Matt Kane 2012
Available under the MIT licence.