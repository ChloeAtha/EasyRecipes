//
//  NotesViewController.swift
//  testApp
//
//  Created by Chloe Atha on 4/30/22.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        noteLabel.text = note 
    }

}
