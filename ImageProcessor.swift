import UIKit

class ImageProcessor {
    func process(image: UIImage, colorSpace: Int, stretchAmount: Float) -> UIImage? {
        guard let cgImage = image.cgImage else { return nil }
        let ds = DecorrelationStretch()
        return ds.apply(to: cgImage, colorSpace: colorSpace, stretchAmount: stretchAmount)
    }
}
