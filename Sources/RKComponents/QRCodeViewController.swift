//
//  QRCodeViewController.swift
//  RKFoundation
//
//  Created by Reha Kılıç on 5.09.2020.
//  Copyright © 2020 RK. All rights reserved.
//

import UIKit

public class QRCodeViewController: UIViewController {
    public let string: String
    private let layout: Layout

    public init(string: String, with layout: Layout) {
        self.string = string
        self.layout = layout
        super.init(nibName: nil, bundle: nil)
    }

    internal required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: generateQRCode(from: string))
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.layout {
            switch self.layout {
            case .fillIn:
                $0.fillIn(view)
            case .centerIn:
                $0.centerIn(view)
            }
        }
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    }
}

public extension QRCodeViewController {
    enum Layout {
        case fillIn, centerIn
    }
}

private extension QRCodeViewController {
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 5, y: 5)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        Log.e("QR code couldn't generated! for: \(string)")
        return nil
    }
}

