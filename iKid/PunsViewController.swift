//
//  PunsViewController.swift
//  iKid
//
//  Created by Pragyna Naik on 5/5/21.
//

import UIKit

class PunsViewController: UIViewController {
    
    @IBOutlet weak var punLabel: UILabel!
    
    fileprivate var joke : PunsJokeController! = nil
    fileprivate var answer : PunsAnswerController! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstBuilder()
        secondBuilder()
        
        switchViewController(joke, to : joke)
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func jokeFlip(_ sender: Any) {
        firstBuilder()
        secondBuilder()
        
        

        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if joke != nil &&
            joke?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            answer.view.frame = view.frame
            punLabel.text = "Sadly, no pun in 10 did."
            switchViewController(joke, to: answer)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            joke.view.frame = view.frame
            punLabel.text = "What happened when I told my friend 10 jokes to get him to laugh?"
            switchViewController(answer, to: joke)
        }
        
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
                from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
                self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }
    
    
    fileprivate func firstBuilder() {
           if joke == nil {
               joke =
                   storyboard?
                       .instantiateViewController(withIdentifier: "PunJoke")
                   as! PunsJokeController
           }
    }
    
    
    fileprivate func secondBuilder() {
           if answer == nil {
               answer =
                   storyboard?
                       .instantiateViewController(withIdentifier: "PunAnswer")
                   as! PunsAnswerController
           }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
