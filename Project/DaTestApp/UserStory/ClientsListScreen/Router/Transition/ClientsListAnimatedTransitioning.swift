//
//  ClientsListAnimatedTransitioning.swift
//  DaTestApp
//
//  Created by Maksim Bazarov on 09/02/2016.
//  Copyright © 2016 Maksim Bazarov (bazaroffma@gmail.com). All rights reserved.
//

import UIKit

class ClientsListAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {

    var sourceViewController: UIViewController!
    var targetViewController: UIViewController!
    var transitionContext: UIViewControllerContextTransitioning?
    var finalFrame = CGRectZero

    //MARK: UIViewControllerAnimatedTransitioning
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.6
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {

        guard let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
        let container = transitionContext.containerView(),
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
            return
        }

        self.transitionContext = transitionContext
        sourceViewController = fromViewController
        targetViewController = toViewController

        finalFrame = transitionContext.finalFrameForViewController(targetViewController)

        container.addSubview(sourceViewController.view)
        container.addSubview(targetViewController.view)
        container.bringSubviewToFront(sourceViewController.view)
        
        setupTargetControllerInitialState()
        setupSourceControllerInitialState()
        animate(inContext: transitionContext)
    }

    //MARK: Animation
    func animate(inContext context: UIViewControllerContextTransitioning) {
        let duration = transitionDuration(context)

        UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseInOut, animations: {
            () -> Void in
            self.setupSourceControllerFinalState()
            self.setupTargetControllerFinalState()
        }) {
            (_) -> Void in
            if let context = self.transitionContext {
                context.completeTransition(true)
            }
        }
    }

    //MARK: initial states
    func setupSourceControllerInitialState() {
        sourceViewController.view.alpha = 1
        sourceViewController.view.frame = finalFrame
    }

    func setupTargetControllerInitialState() {
        targetViewController.view.frame = finalFrame
        targetViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.7, 0.7);
    }

    //MARK: final states
    func setupSourceControllerFinalState() {
        sourceViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 2, 2);
        sourceViewController.view.alpha = 0;
    }
    
    
    func setupTargetControllerFinalState() {
        targetViewController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    }
}