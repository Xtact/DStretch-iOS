import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var originalImageView: UIImageView!
    @IBOutlet weak var enhancedImageView: UIImageView!
    @IBOutlet weak var colorSpaceSegment: UISegmentedControl!
    @IBOutlet weak var stretchSlider: UISlider!
    @IBOutlet weak var processButton: UIButton!

    var originalImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        originalImageView.contentMode = .scaleAspectFit
        enhancedImageView.contentMode = .scaleAspectFit
    }

    @IBAction func selectImage(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true)
        if let image = info[.originalImage] as? UIImage {
            originalImage = image
            originalImageView.image = image
        }
    }

    @IBAction func processImage(_ sender: UIButton) {
        guard let image = originalImage else { return }
        let colorSpace = colorSpaceSegment.selectedSegmentIndex
        let stretchAmount = stretchSlider.value
        let processor = ImageProcessor()
        let enhanced = processor.process(image: image, colorSpace: colorSpace, stretchAmount: stretchAmount)
        enhancedImageView.image = enhanced
    }
}
