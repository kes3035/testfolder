//
//  ViewController.swift
//  MKMapViewTest
//
//  Created by 김은상 on 2023/08/02.
//



import UIKit
import CoreLocation
import MapKit

protocol MapDelegate: AnyObject {
    func cordHandler(with: Location)}


class MapVC: UIViewController, MapDelegate {
    func cordHandler(with: Location){
        self.location = with
        
    }
    
    
    
   
    

    private lazy var mkMapView = MKMapView(frame: self.view.frame)
    private var locationManager = CLLocationManager()   // location Manager
    private var currentLocation: CLLocation = CLLocation(latitude: 37.332651635682176, longitude:  127.11873405786073)
    
    var location: Location? {
        didSet {
            guard let location = location else { return }
            self.mkMapView.setCenter(CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), animated: true)
        }
    }
    
    private lazy var currentLocationButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "location"), for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.tintColor = .gray
        button.addTarget(self, action: #selector(currentLocationTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.tintColor = .gray
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        settingMKMapView()
        settingCLLocationManager()
    }

    func configureUI() {
        view.addSubview(mkMapView)
        view.addSubview(currentLocationButton)
        view.addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            currentLocationButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            currentLocationButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            currentLocationButton.widthAnchor.constraint(equalToConstant: 50),
            currentLocationButton.heightAnchor.constraint(equalToConstant: 50),
            
            searchButton.topAnchor.constraint(equalTo: currentLocationButton.bottomAnchor, constant: 0),
            searchButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            searchButton.widthAnchor.constraint(equalToConstant: 50),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
        
        ])
    }
    
    func settingMKMapView() {
        self.mkMapView.delegate = self
        self.mkMapView.showsUserLocation = true
        self.mkMapView.setRegion(MKCoordinateRegion(center:  CLLocationCoordinate2D(latitude: 37.57273458434912, longitude: 126.97784685534123), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)

        
        // mapKit.zoomEnabled = false         // 줌 가능 여부
        // mapKit.scrollEnabled = false       // 스크롤 가능 여부
        // mapKit.rotateEnabled = false       // 회전 가능 여부
        // mapKit.pitchEnabled = false        // 각도 가능 여부

        
    }

    func settingCLLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // 정확도 최상 설정
        locationManager.requestWhenInUseAuthorization()             // 위치 데이터 승인 요구
        locationManager.startUpdatingLocation()                     // 위치 업데이트 시작
//        self.currentLocation = locationManager.location
        
    
        
    }
    
    
    
    @objc func currentLocationTapped() {
        print("디버깅: 현재위치 버튼 눌림")
        self.mkMapView.showsUserLocation = true
        self.mkMapView.setUserTrackingMode(.follow, animated: true)
        mkMapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.332651635682176, longitude:  127.11873405786073), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
    }
    
    @objc func searchButtonTapped() {
        print("디버깅: 검색 버튼 눌림")
        let searchVC = SearchVC()
        searchVC.mapDelegate = self
//        present(searchVC, animated: true)
        navigationController?.pushViewController(searchVC, animated: true)
        
        
    }
}

extension MapVC: MKMapViewDelegate {
    
}

extension MapVC: CLLocationManagerDelegate {
    
    
}
