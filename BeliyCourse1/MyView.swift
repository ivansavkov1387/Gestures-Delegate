//
//  MyView.swift
//  BeliyCourse1
//
//  Created by Иван on 6/13/22.
//

import UIKit

protocol GestureDelegate: class {
    func didTapIn(view: UIView)
    func didZoomIn(view: UIView)
    func didSwipeIn(view: UIView)
    func didPanIn(view: UIView, pan: UIPanGestureRecognizer?)
    
}

class MyView: UIView {
    weak var delegate: GestureDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isUserInteractionEnabled = true
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapIn))
        self.addGestureRecognizer(tapRecognizer)
        
        let zoomRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didZoomIn))
        self.addGestureRecognizer(zoomRecognizer)
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeIn))
        swipeRecognizer.direction = .left
        self.addGestureRecognizer(swipeRecognizer)
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanIn))
        self.addGestureRecognizer(panRecognizer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func didTapIn() {
        delegate?.didTapIn(view: self)
    }
    
    @objc func didZoomIn() {
        delegate?.didZoomIn(view: self)
    }
    
    @objc func didSwipeIn() {
        delegate?.didSwipeIn(view: self)
    }
    
    @objc func didPanIn() {
        guard let panGesture = self.gestureRecognizers?[3] as? UIPanGestureRecognizer else { return }
        delegate?.didPanIn(view: self, pan: panGesture)
    }
    
    
    
}
