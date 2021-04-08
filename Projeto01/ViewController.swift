import UIKit

protocol testeProtocol {
    func loadImages()
}

class ListTableViewController: UITableViewController, testeProtocol {

    var pictures = [String]()
    var delegate: testeProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadImages()
    }
    
    func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        print(countCharacteres(pictureArray: pictures))
    }
    
    func countCharacteres(pictureArray: [String]) -> String {
        return pictureArray.joined(separator: "/")
    }
    
    func calcutePrice() -> Double {
        return 10.5 + 2.5
    }
}

