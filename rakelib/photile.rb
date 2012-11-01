# convert infile quality 70 - | composite -gravity center /path/to/watermark/image - outfile
# composite -gravity center /path/to/watermark/image infile outfile
# convert infile -crop 405x405 +repage +adjoin -quality 70 outfile_%02d

namespace :image do

  desc "Displays the size of an image"
  task :size do
    size = `identify tmp/original.jpeg`.split(" ")[6]
    puts "Image size: #{size}"
  end

  desc "Changes the quality of an image"
  task :quality do
    `convert tmp/original.jpeg -quality 70 tmp/quality70.jpeg`
    size = `identify tmp/quality70.jpeg`.split(" ")[6]
    puts "Image size: #{size}"
  end

  desc "Changes the quality of an image with 2 compressions"
  task :quality_advanced do
    `convert tmp/original.jpeg -quality 70 tmp/quality70.jpeg`
    `jpegtran -copy none -optimize -perfect -outfile tmp/quality70.jpeg tmp/quality70.jpeg`
    size = `identify tmp/quality70.jpeg`.split(" ")[6]
    puts "Image size: #{size}"
  end

  desc "Applies a watermark to an image"
  task :watermark do
    `composite -gravity center tmp/watermark.png tmp/original.jpeg tmp/watermarked.jpeg`
    size = `identify tmp/watermarked.jpeg`.split(" ")[6]
    puts "Watermarked image. Image size: #{size}"
  end

  desc "Tiles an image by chopping it up into fragments"
  task :tile do
    `convert tmp/original.jpeg -crop 300x300 +repage +adjoin tmp/tile_%02d.jpeg`
  end

  desc "Cleans up temporary files generated"
  task :clean do
    `rm tmp/quality70.jpeg 2>&1`
    `rm tmp/watermarked.jpeg 2>&1`
    `rm tmp/tile_*.jpeg 2>&1`
  end

end

