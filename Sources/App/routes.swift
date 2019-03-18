import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    
    let ylController = YLController()

    let groupedRoute = router.grouped("api/v1")
    
    // THIS ROUTE IS AWESOME BECAUSE IT HANDLES LOGIN
    groupedRoute.post("login", use: ylController.login)
}
