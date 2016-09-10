//
//  ViewController.swift
//  baiduMap
//
//  Created by 朱星 on 16/9/10.
//  Copyright © 2016年 zhuxing. All rights reserved.
//

import UIKit

class ViewController: UIViewController,BMKMapViewDelegate,BMKLocationServiceDelegate {

    let mapView = BMKMapView()
    let service = BMKLocationService()
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.frame = self.view.frame
        self.view.addSubview(mapView)
        self.mapView.showMapScaleBar = true
        self.mapView.delegate = self
        
        service.delegate = self
        service.startUserLocationService()
        
        mapView.showsUserLocation = true
        
    
    }
    
//用户地理位置跟新响应回调
    func didUpdateBMKUserLocation(userLocation: BMKUserLocation!) {
     
        mapView.updateLocationData(userLocation)
        
        
        let viewRegion = BMKCoordinateRegionMake(userLocation.location.coordinate, BMKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
        let region = mapView.regionThatFits(viewRegion)
        
        mapView.setRegion(region, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.mapView.delegate = self

    }

    override func viewDidDisappear(animated: Bool) {
        self.mapView.delegate = nil

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

