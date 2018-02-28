//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
var getURL = URL(string: "https://httpbin.org/get?bar=foo")!
var getRequest = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
getRequest.httpMethod = "GET"
getRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
getRequest.setValue("application/json", forHTTPHeaderField: "Accept")

URLSession.shared.dataTask(with: getRequest, completionHandler: { (data, response, error) -> Void in
    if error != nil { print("GET Request: Communication error: \(error!)") }
    if data != nil {
        do {
            let resultObject = try JSONSerialization.jsonObject(with: data!, options: [])
            DispatchQueue.main.async(execute: {
                print("Results from GET https://httpbin.org/get?bar=foo :\n\(resultObject)") })
        } catch {
            DispatchQueue.main.async(execute: {
                print("Unable to parse JSON response")
            })
        }
    } else {
        DispatchQueue.main.async(execute: {
            print("Received empty response.")
        })
    }
}).resume()
