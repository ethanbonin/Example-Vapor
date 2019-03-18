import Vapor

final class YLController {
    func login(_ req: Request) throws -> Future<LoginModel> {
        let loginInfo = try req.content.decode(LoginModel.self)
        print("THE LOGIN INFO", loginInfo)
        
        // They transfmorm one value to another.
        // Ex. String to Int
//        loginInfo.map // Future<String> to Int
//        loginInfo.transform // Does somethign I don't remmeber
//        loginInfo.flatMap // Future<String> to Future<Int>
        
        let loginInfoPromsie = req.eventLoop.newPromise(LoginModel.self)
        
        loginInfo.whenSuccess { (login) in
            print("THE LOGIN INFO!!!", login)
            loginInfoPromsie.succeed(result: login)
        }
        
        loginInfo.whenFailure { (error) in
            loginInfoPromsie.fail(error: error)
        }
        
        return loginInfoPromsie.futureResult
    }
}
