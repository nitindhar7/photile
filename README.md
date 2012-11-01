# photile

*A ruby gem/library to chop a photo into tiles, watermark them, etc*

* * *

`photile` can be used to power a web widget like [turnandzoom](https://github.com/nitindhar7/turnandzoom) or just about any simple image processing workflow. With `photile` you can run simple tasks like compression, watermarking and tiling images manually or in an automated fashion. These tasks can be combined to formulate a custom flow. For example, you can `compress an image` -> `watermark it` -> `break it up into tiles`.

One scenario where this is really useful is image processing for product images. Most product images are shot on white background, which means that there is a big opportunity to reduce image size and improve rendering speed on the web page. Here's what you can do with `photile`: `basic quality reduction` -> `watermark your product images` -> `break it up into tiles (certain tiles will be all white)` -> `compress individual tiles`.


