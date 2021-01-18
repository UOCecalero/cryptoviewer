//
//  ImageView+Extensions.swift
//  Cryptoviewer
//
//  Created by Developer on 13/1/21.
//  Copyright © 2021 Iflet.tech. All rights reserved.
//

import UIKit
import SVGParser
extension UIImageView {
    func setImageFromUrl(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with:url, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                //let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    SVGParser(xmlData: data!).scaledImageWithSize(self.frame.size, completion: { image in
                        if let img = image {
                            self.image = img
                        }
                    })
                }
            })
            
        }).resume()
    }
}
