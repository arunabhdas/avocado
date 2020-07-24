import Foundation
import Combine


enum WeatherError: Error {
    case thingsJustHappen
}


let weatherPublisher = PassthroughSubject<Int, WeatherError>()

let subscriber = weatherPublisher
    .filter { $0 > 25 }
    .sink(receiveCompletion: { (value) in
        //
    }, receiveValue: { value in
        print("A summer day of \(value) C")
    })


let anotherSubscriber = weatherPublisher.handleEvents(receiveSubscription: { subscription in
    print(" New subscription \(subscription)")
}, receiveOutput: { output in
    print(" New value \(output)")
}, receiveCompletion: { error in
    print("Subscription completed with potential error \(error)")
}, receiveCancel: {
    print(" Subscription cancelled")
}).sink(receiveCompletion: { value in
}) { value in
    print("Subscriber received value \(value)")
}

weatherPublisher.send(10)
weatherPublisher.send(20)
weatherPublisher.send(24)
weatherPublisher.send(26)
weatherPublisher.send(28)
weatherPublisher.send(30)
weatherPublisher.send(18)
