import XCTest

@testable import Projeto_01

class ListTableViewControllerTests: XCTestCase {
        
    let sut = ViewController()
    
    let arrayMock: [String] = ["nssl0049.jpg", "nssl0046.jpg", "nssl0091.jpg", "nssl0045.jpg", "nssl0051.jpg", "nssl0041.jpg", "nssl0042.jpg", "nssl0043.jpg", "nssl0033.jpg", "nssl0034.jpg"]

    func testLoadImages() throws {
        sut.loadImages()
        XCTAssertEqual(arrayMock.count, sut.pictures.count)
        XCTAssertTrue(sut.pictures.contains("nssl0033.jpg"))
    }
    
    func testcountCharacteresWith129Size() {
        sut.loadImages()
        let unitedString = sut.countCharacteres(pictureArray: arrayMock )
        XCTAssertEqual(unitedString.count, 129)
    }

    func testcountCharacteresIsEmpty() {
        sut.loadImages()
       let unitedString = sut.countCharacteres(pictureArray: [""])
        XCTAssertEqual(unitedString.count, 0)
    }
}
