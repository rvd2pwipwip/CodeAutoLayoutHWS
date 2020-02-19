//
//  ViewController.swift
//  CodeAutoLayoutHWS
//
//  Created by Herve Desrosiers on 2020-02-19.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var previous: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // VFL stuff... no safeAreaLayoutGuide
//        view.addSubview(label1)
//        view.addSubview(label2)
//        view.addSubview(label3)
//        view.addSubview(label4)
//        view.addSubview(label5)
        
        //        let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
        //        let metrics = ["labelHeight": 88]
        //
        //        for label in viewsDictionary.keys {
        //            view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
        //        }
        //        view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]->=10-|", options: [], metrics: metrics, views: viewsDictionary))
        
        setupLabels()
    }
    
    func setupLabels() {
        var previous: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
            view.addSubview(label)
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            // when you use both a multiplier and a constant, the multiplier gets factored in first then the constant
            label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/5, constant: -10).isActive = true
            
            if let previous = previous {
                // we have a previous label – create a height constraint
                label.topAnchor.constraint(equalTo: previous.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
            } else {
                // this is the first label
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            // set the previous label to be the current one, for the next loop iteration
            previous = label
        }
    }
    
    
    let label1: UILabel = {
        let lv = UILabel()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.backgroundColor = .red
        lv.text = "THESE"
        lv.sizeToFit()
        return lv
    }()
    
    let label2: UILabel = {
        let lv = UILabel()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.backgroundColor = .cyan
        lv.text = "ARE"
        lv.sizeToFit()
        return lv
    }()
    
    let label3: UILabel = {
        let lv = UILabel()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.backgroundColor = .yellow
        lv.text = "SOME"
        lv.sizeToFit()
        return lv
    }()
    
    let label4: UILabel = {
        let lv = UILabel()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.backgroundColor = .green
        lv.text = "AWESOME"
        lv.sizeToFit()
        return lv
    }()
    
    let label5: UILabel = {
        let lv = UILabel()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.backgroundColor = .orange
        lv.text = "LABELS"
        lv.sizeToFit()
        return lv
    }()
    
}

