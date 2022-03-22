//
//  ImageDownloader.swift
//  RKFoundation
//
//  Created by Reha Kilic on 1.02.2019.
//  Copyright © 2020 RK. All rights reserved.
//
import UIKit

public protocol ImageDownloader {
    func loadImage(from url: URL, handler: @escaping (UIImage?, Error?) -> Void)
}

public final class DefaultImageDownloader: ImageDownloader {
    private let session: URLSession
    private let imageCacher: ImageCacher

    public init(session: URLSession = .shared, imageCacher: ImageCacher) {
        self.session = session
        self.imageCacher = imageCacher
    }

    public func loadImage(from url: URL, handler: @escaping (UIImage?, Error?) -> Void) {
        if let image = imageCacher.item(for: url.absoluteString) {
            handler(image, nil)
            return
        }

        session.dataTask(with: url) { data, _, error in
            guard
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    DispatchQueue.main.async { handler(nil, error) }
                    return
            }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.imageCacher.set(value: image, for: url.absoluteString)
                handler(image, nil)
            }
        }.resume()
    }
}

public enum ImageDownloaderFactory {
    public static func makeImageDownloader() -> ImageDownloader {
        return DefaultImageDownloader(imageCacher: ImageCacher())
    }
}
