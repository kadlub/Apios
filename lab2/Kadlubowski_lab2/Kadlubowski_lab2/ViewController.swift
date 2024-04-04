//
//  ViewController.swift
//  Kadlubowski_lab2
//
//  Created by Jakub Kadlubowski on 25/03/2024.
//

import Cocoa

class ViewController: NSViewController {

    /*@IBOutlet weak var Label1: NSTextField!
    
    @IBOutlet weak var Label2: NSTextField!
    
    @IBOutlet weak var Label3: NSTextField!
    
    @IBOutlet weak var Label4: NSTextField!
    
    @IBOutlet weak var Label5: NSTextField!*/
    
    @IBOutlet weak var textFieldsGrid: NSGridView!
    @IBOutlet weak var numbers: NSGridView!
    @IBOutlet weak var submitButton: NSButton!
    @IBOutlet weak var newGameButton: NSButton!
    
    private var model = WordleModel()
    
    var textFields = [NSTextField]()
    var digitButtons = [NSButton]()
    var result = [Int]()
    var currentColumn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeTextFields()
        initializeDigitButtons()
        model.generateAnswer()
        submitButton.isEnabled = false

        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func initializeTextFields(){
        for i in 0..<5 {
            let textField = textFieldsGrid.cell(atColumnIndex: i, rowIndex: 0).contentView as! NSTextField
            textFields.append(textField)
        }
    }
    
    func initializeDigitButtons(){
        for i in 0..<10{
            let digitButton = numbers.cell(atColumnIndex: i, rowIndex: 0).contentView as! NSButton
            digitButton.title = "\(i)"
            digitButtons.append(digitButton)
        }
    }
    
    func changeTextField(number: String){
        if currentColumn < 5{
            textFields[currentColumn].stringValue = number
            currentColumn += 1
            if currentColumn == 4{
                submitButton.isEnabled = true}
        }
    }
    
    func resetBoard(){
        for i in 0..<5{
            textFields[i].stringValue = ""
            textFields[i].backgroundColor = NSColor.clear
        }
    }
    
    @IBAction func digitButtonPressed(_ sender: NSButton){
        if let digit = sender.title as String?{
            changeTextField(number: digit)
        }
    }
    
    
    
    @IBAction func submitButtonPressed(_ sender: Any){
        if currentColumn == 5{
            var guessedNumbers = [Int]()
            var correctOnPlace = 0
            var correctButMisplaced = 0
            
            
            for i in 0..<5{
                if let number = Int(textFields[i].stringValue){
                    if number == model.getAnswer()[i]{
                        correctOnPlace += 1
                        textFields[i].backgroundColor = NSColor.green
                    }
                    else if model.getAnswer().contains(number){
                        correctButMisplaced += 1
                        textFields[i].backgroundColor = NSColor.orange
                    }
                    else{
                        textFields[i].backgroundColor = NSColor.gray
                    }
                }
            }
        }
    }

    
    @IBAction func newGameButtonClicked(_ sender: NSButton){
        model.generateAnswer()
        resetBoard()
        currentColumn = 0
    }




}

