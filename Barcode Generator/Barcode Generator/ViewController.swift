//
//  ViewController.swift
//  Barcode Generator
//
//  Created by RAMDHAN CHOUDHARY on 07/06/19.
//  Copyright © 2019 RDC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var barcodeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createBardcode(_ sender: Any) {
        let image = generateBarcode(from: "Test11")
        barcodeImageView.image = image
    }
    
    func generateBarcode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
}
