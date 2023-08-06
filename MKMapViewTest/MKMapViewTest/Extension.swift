//
//  Extension.swift
//  MKMapViewTest
//
//  Created by 김은상 on 2023/08/03.
//

import UIKit
import CoreLocation
import MapKit

extension UINavigationController {
    
    func setupBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .clear
        
        
    }
    
    func popViewControllerWithHandler(animated:Bool = true, completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: animated)
        CATransaction.commit()
    }

    func pushViewController(viewController: UIViewController, animated:Bool = true,  completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    
}

struct Location {
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
}

struct Constant {
    static let color = UIColor(red: 0.12, green: 0.27, blue: 0.56, alpha: 1.00)
}

class Marker: NSObject, MKAnnotation {
  let title: String?
  let coordinate: CLLocationCoordinate2D
  let subtitle:String?

  init(
    title: String?,
    subtitle: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.subtitle = subtitle
    self.coordinate = coordinate

    super.init()
  }

}
