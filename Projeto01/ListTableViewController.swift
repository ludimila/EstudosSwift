import UIKit

protocol testeProtocol {
    func loadImages()
}

class ListTableViewController: UITableViewController, testeProtocol {
    
    var pictures = [String]()
    var delegate: testeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        loadImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showMySandBox()
    }
    
    ///Um SandBox pode ser visto como um contêiner dentro do qual o aplicativo opera.
    ///Retorna o caminho para o diretório pessoal do usuário ou do aplicativo, dependendo da plataforma.
    private func showMySandBox() {
        let homeDirectory = NSHomeDirectory()
        let documentsFolder = homeDirectory.appending("/Documents")
        print(homeDirectory)
    }
    
    
    private func configureNavigation() {
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
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
        pictures = pictures.sorted()
        //print(countCharacteres(pictureArray: pictures))
    }
    
    func countCharacteres(pictureArray: [String]) -> String {
        return pictureArray.joined(separator: "/")
    }
    
    func calcutePrice() -> Double {
        return 10.5 + 2.5
    }
}


extension ListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedPicutreNumber = indexPath.row
            vc.totalPictures = pictures.count
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
