//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
var httpURL = URL(string: "https://apple.com")!
var httpTask = URLSession.shared.dataTask(with: httpURL) {
    (data, response, error) in
    guard let validData = data, error == nil else {
        DispatchQueue.main.async(execute: {
            print("Error getting apple website\n") })
        return
    }
    var results = String(data: data!, encoding: String.Encoding.utf8) ?? "Error decoding Apple's website HTML\n"
    DispatchQueue.main.async(execute: {
        print("Correctly read \(results.characters.count) characters from Apple's website HTML\n")
    })
}
DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async(execute: {
    httpTask.resume()
})
