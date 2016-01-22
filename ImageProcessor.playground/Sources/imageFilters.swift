import UIKit

public class imageFilters{
    
    public init(){
        
    }
    

    
    public func proccesFilter(filter: String, image : UIImage, var intensity: Float) -> UIImage{
        let result : UIImage
        if (intensity <= 0){
            intensity = 1
        }
        switch filter {
            case "Red":
                result = filterRed(image,intensity: intensity)
            case "Green":
                result = filterGreen(image,intensity: intensity)
            case "Blue":
                result = filterBlue(image,intensity: intensity)
            case "BlackAndWhite":
                result = filterBlackAndWhite(image,intensity: intensity)
            case "Sepia":
                result = filterSepia(image,intensity: intensity)
        default:
                result = image
        }
        return result
    }
    
    
    func filterRed(image : UIImage, intensity: Float) -> UIImage{
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                
                let index = y * rgbaImage.width + x
                var pix: Pixel = (rgbaImage.pixels[index])
                let red: Float = Float(pix.red) * intensity
                let green: Float = 0
                let blue: Float = 0
                
                pix.red = UInt8(max( min(255, Float(red)), 0))
                pix.green = UInt8(green)
                pix.blue = UInt8(blue)
                
                rgbaImage.pixels[index] = pix;
            }
        }
        let result = rgbaImage.toUIImage()!
        return result
    }
    
    
    
    func filterBlue(image : UIImage, intensity: Float) -> UIImage{
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pix: Pixel = (rgbaImage.pixels[index])
                let red: Float = 0
                let green: Float = 0
                let blue: Float = Float(pix.blue) * intensity
                
                pix.red = UInt8(red)
                pix.green = UInt8(green)
                pix.blue = UInt8(max( min(255, Float(blue)), 0))
                
                rgbaImage.pixels[index] = pix;
            }
        }
        let result = rgbaImage.toUIImage()!
        return result
    }
    
    
    func filterGreen(image : UIImage, intensity: Float) -> UIImage{
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pix: Pixel = (rgbaImage.pixels[index])
                let red: Float = 0
                let green: Float = Float(pix.green) * intensity
                let blue: Float = 0
                
                pix.red = UInt8(red)
                pix.green = UInt8(max( min(255, Float(green)), 0))
                pix.blue = UInt8(blue)
                
                rgbaImage.pixels[index]=pix
            }
        }
        let result = rgbaImage.toUIImage()!
        return result
    }
    
    func filterBlackAndWhite(image : UIImage,intensity: Float) -> UIImage{
        let rgbaImage = RGBAImage(image: image)!
       
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pix: Pixel = (rgbaImage.pixels[index])
                let red: Float = Float(pix.red) * intensity
                let green: Float = Float(pix.red) * intensity
                let blue: Float = Float(pix.red) * intensity
                
                pix.red = UInt8(max( min(255, Float(red)), 0))
                pix.green = UInt8(max( min(255, Float(green)), 0))
                pix.blue = UInt8(max( min(255, Float(blue)), 0))
                rgbaImage.pixels[index]=pix
            }
        }
        let result = rgbaImage.toUIImage()!
        return result
    }
 
    func filterSepia(image : UIImage,intensity: Float) -> UIImage{
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pix: Pixel = (rgbaImage.pixels[index])
                let red: Float = Float(pix.red) * intensity
                let green: Float = Float(pix.red)
                let blue: Float = Float(pix.red)
                
                pix.red = UInt8(max( min(255, Float(red) * 2), 0))
                pix.green = UInt8(max( min(255, Float(green)), 0))
                pix.blue = UInt8(max( min(255, Float(blue)), 0))
                rgbaImage.pixels[index]=pix
            }
        }
        let result = rgbaImage.toUIImage()!
        return result
    }
    
    
}

