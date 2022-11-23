//
//  MapViewController.swift
//  JustTakeCar
//
//  Created by Евгений Буракевич on 22.07.22.
// 

struct carOnMap {
    var name: String
    var lattitude: CLLocationDegrees
    var longtitude: CLLocationDegrees
}

import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController, MKMapViewDelegate{
    
    private let zoomPlusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
       
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(zoomPlus), for: .touchUpInside)
        button.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 1) , for: .normal)
         button.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 0.6) , for: .highlighted)
        button.layer.cornerRadius = 10
        return button
    }()
    var zoom = 0.4
    @objc private func zoomPlus() {
        mapView.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: zoom, longitudeDelta: zoom)), animated: true)
        if zoom > 0.1 {
        zoom = zoom - 0.05
        } else if zoom > 0.02{
            zoom = zoom - 0.01
        }
    }
    private let zoomMinusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 1) , for: .normal)
         button.setTitleColor(UIColor(red: 1, green: 0.992, blue: 0.992, alpha: 0.6) , for: .highlighted)
        button.addTarget(self, action: #selector(zoomMinus), for: .touchUpInside)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        return button
    }()
    @objc private func zoomMinus() {
        mapView.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: zoom, longitudeDelta: zoom)), animated: true)
        if zoom < 10 {
        zoom = zoom + 0.05
    }
    }
    let mapView = MKMapView()
    let mapLabel = UILabel()
    let coordinate = CLLocationCoordinate2D(latitude: 53.901087, longitude: 27.545000)
    let carsOnMap = [carOnMap(name: "Tesla Model X", lattitude: 53.904169, longtitude: 27.555220),
    carOnMap(name: "VW POLO", lattitude: 53.904603, longtitude: 27.543578),
    carOnMap(name: "BMW X5", lattitude: 53.910087, longtitude: 27.544296),
    carOnMap(name: "KIA Rio", lattitude: 53.901087, longtitude: 27.545000),
                     carOnMap(name: "Lada Westa", lattitude: 53.911000, longtitude: 27.559220),
                     carOnMap(name: "VW Polo", lattitude: 53.911017, longtitude: 27.558120),
                     carOnMap(name: "Renault Logan", lattitude: 53.909087, longtitude: 27.557330)]
    
    func checkLoacationEnable() {
        if CLLocationManager.locationServicesEnabled() {
        } else {
            let alert = UIAlertController(title: "you have geolocation disabled", message: "On location?", preferredStyle: .alert)
            let settingsAction = UIAlertAction(title: "Settings", style: .default) { (alert) in
                if let url = URL(string: "App-Prefs:root=LOCATION_SERVICES") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(settingsAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                guard self != nil else {
                    return
                }
            }
        }
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        view.backgroundColor = .white.withAlphaComponent(0.9)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        checkLoacationEnable()
        custom0()
        custom1()
        custom2()
        custom3()
        custom4()
        custom5()
        custom6()
    }
    private func custom0() {
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: carsOnMap[0].lattitude, longitude: carsOnMap[0].longtitude)
        pin.title = carsOnMap[0].name
        pin.subtitle = "0.99 USD / min"
        mapView.addAnnotation(pin)
    }
    private func custom1() {
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: carsOnMap[1].lattitude, longitude: carsOnMap[1].longtitude)
        pin.title = carsOnMap[1].name
        pin.subtitle = "0.49 USD / min"
        mapView.addAnnotation(pin)
    }
    private func custom2() {
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: carsOnMap[2].lattitude, longitude: carsOnMap[2].longtitude)
        pin.title = carsOnMap[2].name
        pin.subtitle = "0.99 USD / min"
        mapView.addAnnotation(pin)
    }
    private func custom3() {
              let pin = MKPointAnnotation()
              pin.coordinate = CLLocationCoordinate2D(latitude: carsOnMap[3].lattitude, longitude: carsOnMap[3].longtitude)
              pin.title = carsOnMap[3].name
              pin.subtitle = "0.49 USD / min"
              mapView.addAnnotation(pin)
          }
    private func custom4() {
              let pin = MKPointAnnotation()
              pin.coordinate = CLLocationCoordinate2D(latitude: carsOnMap[4].lattitude, longitude: carsOnMap[4].longtitude)
              pin.title = carsOnMap[4].name
              pin.subtitle = "0.49 USD / min"
              mapView.addAnnotation(pin)
          }
    private func custom5() {
              let pin = MKPointAnnotation()
              pin.coordinate = CLLocationCoordinate2D(latitude: carsOnMap[5].lattitude, longitude: carsOnMap[5].longtitude)
              pin.title = carsOnMap[5].name
              pin.subtitle = "0.49 USD / min"
              mapView.addAnnotation(pin)
          }
    private func custom6() {
              let pin = MKPointAnnotation()
              pin.coordinate = CLLocationCoordinate2D(latitude: carsOnMap[6].lattitude, longitude: carsOnMap[6].longtitude)
              pin.title = carsOnMap[6].name
              pin.subtitle = "0.49 USD / min"
              mapView.addAnnotation(pin)
          }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let leftMargin:CGFloat = 16
        let topMargin:CGFloat = (view.frame.size.height / 2) - (view.frame.size.height / 4) - (view.frame.size.height / 7)
        let mapWidth:CGFloat = view.frame.size.width - 32
        let mapHeight:CGFloat = 64
        let zoomPlusleftMargin:CGFloat = (view.frame.size.width / 2) + (view.frame.size.width / 4) + (view.frame.size.width / 10)
        let zoomPlustopMargin:CGFloat = (view.frame.size.height / 2) - (view.frame.size.height / 32)
        let zoomPlusmapWidth:CGFloat = 40
        let zoomPlusmapHeight:CGFloat = 40
        let zoomMinusleftMargin:CGFloat = (view.frame.size.width / 2) + (view.frame.size.width / 4) + (view.frame.size.width / 10)
        let zoomMinustopMargin:CGFloat = (view.frame.size.height / 2) + (view.frame.size.height / 32)
        let zoomMinusmapWidth:CGFloat = 40
        let zoomMinusmapHeight:CGFloat = 40
        zoomMinusButton.frame = CGRect(x: zoomMinusleftMargin, y: zoomMinustopMargin, width: zoomMinusmapWidth, height: zoomMinusmapHeight)
        zoomPlusButton.frame = CGRect(x: zoomPlusleftMargin, y: zoomPlustopMargin, width: zoomPlusmapWidth, height: zoomPlusmapHeight)
        mapView.frame = view.bounds
        mapLabel.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        mapLabel.text = "Choose a car on the map".localized()
        mapLabel.backgroundColor = .black
        mapLabel.layer.cornerRadius = 20
        mapLabel.textAlignment = .center
        mapLabel.font = UIFont(name: "Futura-Bold", size: 24)
        mapLabel.textColor = .white
        mapView.mapType = MKMapType.standard
                mapView.isZoomEnabled = true
                mapView.isScrollEnabled = true
                mapView.center = view.center
                
        view.addSubview(mapView)
        view.addSubview(mapLabel)
        view.addSubview(zoomPlusButton)
        view.addSubview(zoomMinusButton)
        
        mapView.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)), animated: true)
        
            }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        }
        else {
            annotationView?.annotation = annotation

        }
        annotationView?.image = UIImage(named: "carMap")
        annotationView?.calloutOffset = CGPoint(x: 0, y: 10)
        return annotationView
    }
   func mapView(_ mapView: MKMapView,
                         didSelect view: MKAnnotationView){
        guard let coordinate = LocationManager.shared.manager.location?.coordinate else {
            return
        }
        self.mapView.removeOverlays(mapView.overlays)
        let car = view.annotation
        let startPoint = MKPlacemark(coordinate: coordinate)
        let endPoint = MKPlacemark(coordinate: car!.coordinate)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startPoint)
        request.destination = MKMapItem(placemark: endPoint)
        request.transportType = .walking
        let direction = MKDirections(request: request)
        direction.calculate { (response, error) in
            guard let response = response else { return }
            for route in response.routes {
                self.mapView.addOverlay(route.polyline)
        }
    }
}
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .systemRed
        renderer.lineWidth = 4
        return renderer
    }
}
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
    }
}
