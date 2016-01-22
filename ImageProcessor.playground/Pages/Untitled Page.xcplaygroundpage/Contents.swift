//: Playground - noun: a place where people can play

import UIKit

var image = UIImage(named: "minion")
// Process the image!
var imageFiltered : UIImage!
var filter : imageFilters! = imageFilters()


/*
    Intensity values: 1 to 10
*/
imageFiltered = filter.proccesFilter("Red" , image: image!, intensity: 1)


imageFiltered = filter.proccesFilter("Green", image: image!, intensity: 1)


imageFiltered = filter.proccesFilter("Blue", image: image!, intensity: 1)


imageFiltered = filter.proccesFilter("BlackAndWhite", image: image!, intensity: 1)


imageFiltered = filter.proccesFilter("Sepia", image: image!,intensity: 1)
