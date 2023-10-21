import Foundation

/// This enum is responsible for logging action.
enum Log {
    
    /// This enum have options to represent the severity of logged text.
    fileprivate enum Severity: String {
        case info = "ℹ️ - Info"
        case warning = "⚠️ - Warning"
        case error = "❌ - Error"
    }
    
    /// This struct is responsible for providing specific information about the logged text.
    fileprivate struct Context {
        
        /// File name
        private let file: String
        
        /// Function name
        private let function: String
        
        /// Line number
        private let line: Int
        
        init(file: String, function: String, line: Int) {
            self.file = file
            self.function = function
            self.line = line
        }
        
        /// Readable formatted context information.
        var information: String {
            return "Path: \((file as NSString).lastPathComponent), Line: \(line), Function: \(function)"
        }
    }
    
    /// This function internally handle the desired accesible log event.
    ///
    /// - Parameters:
    ///   - severity: The severity level of the log event.
    ///   - description: Description of the log event.
    ///   - includeContext: Decision of context information addition to the log event.
    ///   - context: Context information for the log event.
    fileprivate static func handle(severity: Severity, description: String, includeContext: Bool, context: Context) {
        let components = ["[\(severity.rawValue)]", description]
        
        var textToLog = components.joined(separator: " ")
        (includeContext) ? (textToLog += " Context: [\(context.information)]") : (textToLog += "")
        
        ///Restrict the log behavior to development environment only.
        #if DEBUG
        print(textToLog)
        #endif
    }
}

// MARK: Public Methods
extension Log {
    
    /// This function will print the info log event to the console which is only visible in the development environment.
    ///
    /// - Parameters:
    ///   - text: Developer description for the log event.
    ///   - includeContext: Decision of context information addition to the log event.
    ///   - file: File name for adding context information of log event.
    ///   - line: Line number for adding context information of log event.
    ///   - function: Function name for adding context information of log event.
    static func info(_ text: StaticString, includeContext: Bool, file: String = #file, line: Int = #line, function: String = #function) {
        let context = Context(file: file, function: function, line: line)
        Log.handle(severity: .info, description: text.description, includeContext: includeContext, context: context)
    }
 
    /// This function will print the warning log event to the console which is only visible in the development environment.
    ///
    /// - Parameters:
    ///   - text: Developer description for the log event.
    ///   - includeContext: Decision of context information addition to the log event.
    ///   - file: File name for adding context information of log event.
    ///   - line: Line number for adding context information of log event.
    ///   - function: Function name for adding context information of log event.
    static func warning(_ text: StaticString, includeContext: Bool, file: String = #file, line: Int = #line, function: String = #function) {
        let context = Context(file: file, function: function, line: line)
        Log.handle(severity: .warning, description: text.description, includeContext: includeContext, context: context)
    }
    
    /// This function will print the error log event to the console which is only visible in the development environment.
    ///
    /// - Parameters:
    ///   - text: Developer description for the log event.
    ///   - includeContext: Decision of context information addition to the log event.
    ///   - file: File name for adding context information of log event.
    ///   - line: Line number for adding context information of log event.
    ///   - function: Function name for adding context information of log event.
    static func error(_ text: StaticString, includeContext: Bool, file: String = #file, line: Int = #line, function: String = #function) {
        let context = Context(file: file, function: function, line: line)
        Log.handle(severity: .error, description: text.description, includeContext: includeContext, context: context)
    }
}

// MARK: Information about StaticString
/// Any time you can give Swift more information about how a variable is to be used, it can optimize the code using it. By restricting a variable to StaticString, Swift knows the variable won't be mutated so it might be able to store it more efficiently, or access the individual characters more efficiently. In fact, StaticString could be implemented with just an address pointer and a length. The address it points to is just the place in the static code where the string is defined. A StaticString doesn't need to be reference counted since it doesn't (need to) exist in the heap. It is neither allocated nor deallocated, so no reference count is needed.

