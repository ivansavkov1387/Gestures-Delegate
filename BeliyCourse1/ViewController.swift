//
//  ViewController.swift
//  BeliyCourse1
//
//  Created by Иван on 5/29/22.
//

import UIKit

class ViewController: UIViewController {
    let blueView: MyView = {
        let view = MyView()
        view.frame = CGRect(x: 5, y: 60, width: 400, height: 200)
        view.backgroundColor = .blue
        return view
    }()
    
    let greenView: MyView = {
        let view = MyView()
        view.frame = CGRect(x: 5, y: 330, width: 400, height: 200)
        view.backgroundColor = .green
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 5, y: 270, width: 400, height: 50)
        label.text = "HELLO"
        label.textAlignment = .center
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueView.delegate = self
        greenView.delegate = self
        view.addSubview(blueView)
        view.addSubview(greenView)
        view.addSubview(label)
    }
    
    
}

extension ViewController: GestureDelegate {
    
    
    func didTapIn(view: UIView) {
        if view === greenView {
            label.text = "Green View was taped"
        } else {
            label.text = "Blue View was taped"
        }
    }
    
    func didZoomIn(view: UIView) {
        if view === greenView {
            label.text = "Green View was zoomed"
        } else {
            label.text = "Blue View was zoomed"
        }
    }
    
    func didSwipeIn(view: UIView) {
        if view === greenView {
            label.text = "Green View was swiped"
        } else {
            label.text = "Blue View was swiped"
        }
    }
    
    func didPanIn(view: UIView, pan: UIPanGestureRecognizer?) {
        guard let recognizer = pan else { return }
        switch recognizer.state {
        case .changed: fallthrough
        case .ended:
            let translation = recognizer.translation(in: view)
            view.center.x += translation.x
            view.center.y += translation.y
            if view === greenView {
                label.text = "Green View \(translation)"
            } else {
                label.text = "Blue View \(translation)"
            }
            print(translation)
            // выводим на экран все «дельта» точки от последнего вызова
            recognizer.setTranslation(CGPoint.zero, in: view)
        default: break
        }
    }
    
}




