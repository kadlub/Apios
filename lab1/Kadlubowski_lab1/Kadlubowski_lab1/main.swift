//
//  main.swift
//  Kadlubowski_lab1
//
//  Created by Jakub Kadlubowski on 11/03/2024.
//

import Foundation

class Node{
    var key: Int
    var data: Any?
    var left: Node?
    var right: Node?
    weak var upper: Node?
    
    init(_ key: Int,_ data: Any?,_ upper: Node?)
    {
        self.key = key
        self.data = data
        self.upper = upper
        self.left = nil
        self.right = nil
        print("New Node created")
    }
    deinit{
        print("Node: \(key) deleted")
        
    }
}

class Container{
    var root: Node?
    
    init(){
        print("New Container created")
    }
    
    deinit{
        print("Container deleted")
    }
    
    func insert(_ key: Int, _ data: Any? = nil){
            root = insertRec(root, key, data, nil)
        }
    
    private func insertRec(_ node: Node?, _ key: Int, _ data: Any?, _ upper: Node?) -> Node{
        if let node = node{
            if key < node.key{
                node.left = insertRec(node.left, key, data, node)
            }
            else if key > node.key{
                node.right = insertRec(node.right, key, data, node)
            }
            return node
        }
        else{
            return Node(key, data, upper)
        }
    }
    
    func printContainer(){
        recPrintContainer(root)
    }
    
    private func recPrintContainer(_ node: Node?){
        if let node = node {
            recPrintContainer(node.left)
            print("Key: \(node.key), Data: \(node.data ?? "N/A")")
            recPrintContainer(node.right)
        }
    }
}

var new_Container: Container? = Container()
new_Container?.insert(1, "Swift")
new_Container?.insert(3, "Flutter")
new_Container?.insert(2, "iOS")
new_Container?.insert(4, "iCloud")

new_Container?.printContainer()

new_Container = nil

