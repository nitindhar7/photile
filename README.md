# photile**

* * *
*A ruby gem/library to chop a photo into tiles, watermark them, etc*
* * *

`photile` can be used to power a web widget like [turnandzoom](https://github.com/nitindhar7/turnandzoom) or just about any simple image processing workflow. With `photile` you can run simple tasks like compression, watermarking and tiling images manually or in an automated fashion. These tasks can be combined to formulate a custom flow. For example, you can `compress an image` → `watermark it` → `break it up into tiles`.

One scenario where this is really useful is image processing for product images. Most product images are shot on white background, which means that there is a big opportunity to reduce image size and improve rendering speed on the web page. Here's what you can do with `photile`: `basic quality reduction` → `watermark your product images` → `break it up into tiles (certain tiles will be all white)` → `compress individual tiles`.

### Functions

* Quality manipulation
* Loss-less compression
* Watermarking
* Tiling

### Piping

The four main functions of `photile` can be used in all combinations possible because of their 'piping' properties (i.e., the Builder Pattern). Each function takes in an image and spits out an image or an array of images. When an array of images is returned any function thereafter is applied to all items in the array. When piping functions the order is relevant as the output of a function becomes the input of another. For example: `tile` → `watermark` (tiles images and then applies a watermark to the smaller, chopped images) is not the same as `watermark` → `tile` (watermarks an image and then creates tiles).

Here are the piping scenarios available

* `IMAGE` → `Quality Modifier` → `IMAGE`
* `IMAGE` → `Compressor` → `IMAGE`
* `IMAGE` + `WATERMARK IMAGE`  → `Watermarker` → `IMAGE`
* `IMAGE` → `Tiler` → `[IMAGE...IMAGE]`

### Examples

```bash
# Basic Examples
$ photile -quality 80 image-in image-out
$ photile -compress image-in image-out
$ photile -watermark image-in image-watermark image-out
$ photile -tile WIDTHxHEIGHT image-in [image-out-0...image-out-n]

# Advanced Examples

# 1. Reduce quality and then loss less compression for 'image-in' to produce 'image-out'
$ photile -quality 80 -compress image-in image-out

# 2. Watermark 'image-in' with 'image-watermark' and then tile it with size 'WIDTHxHEIGHT' to produce '[image-out-0...image-out-n]'
$ photile -watermark -tile WIDTHxHEIGHT image-in image-watermark image-out

# 3. Reduce quality of 'image-in', then compress it and watermark it with 'image-watermark'. Finally, tile the watermarked image to produce '[image-out-0...image-out-n]'
$ photile -quality 80 -compress -watermark -tile WIDTHxHEIGHT image-in image-watermark [image-out-0...image-out-n]
```

### More

Photile uses the amazing [Imagemagick](http://www.imagemagick.org/script/index.php) and [Jpegtran](http://jpegclub.org/jpegtran/) libraries. Imagemagick provides quality, watermarking and tiling properties. Jpegtran provides the loss-less compression. In other words, `photile` is just a layer on top of existing libraries to make certain image processing tasks dead simple. Additionally since `photile` is a gem it can be used directly in Rails to create dynamic workflows.

** `photile` is in a pre-release &alpha; state at the moment.

* * *
Copyright (c) 2012 Nitin Dhar. See [MIT-LICENSE](MIT-LICENSE) for details.
