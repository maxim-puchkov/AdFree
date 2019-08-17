import Cocoa

var str = "Hello, playground"

//[{
//    "trigger": {
//        "url-filter": "^[^:]+://+([^:/]+\\.)?247realmedia\\.com[:/]",
//        "url-filter-is-case-sensitive":true,
//        "load-type" : ["third-party"]
//    },
//    "action": {
//        "type": "block"
//    }
//]


/* Enums */
enum ComponentType: String {
    case action = "action"
    case trigger = "trigger"
}

enum ActionType: String {
    case block = "block"
    case block_cookies = "block-cookies"
    case css_display_none = "css-display-none"
}

// Not used
enum ResourceLoadType: String {
    case first_party = "first-party"
    case third_party = "third-party"
}









/* Protocol */
protocol SerializableComponent {
    var componentType: ComponentType { get }
    var fields: [(String, Any)] { get set }
    
    func serialize() -> String
}

class Serializable: SerializableComponent {
    
    // Component key type and associated fields
    public let componentType: ComponentType
    public var fields: [(String, Any)]
    
    
    // Serializable object initialization
    init(type: ComponentType, fields: [(String, Any)]) {
        self.componentType = type
        self.fields = fields
    }
    
    
    
    // Serialize object
    public func serialize() -> String {
        var result: String = ""
        
        result = "\"\(self.componentType)\": "
        result += "{"
        for field in self.fields {
            // Set key (String)
            //  and value (String, unless true, false, or Array)
            let key = "\"\(field.0)\""
            var value = "\(field.1)"
            if ((value != "true" && value != "false") && !isArray(field.1)) {
                value = "\"\(field.1)\""
            }
            
            // Append (key: value) pairs
            result += "\(key): \(value)"
            if (field.0 != self.fields.last!.0) {
                result += ", "
            }
        }
        result += "}"
        
        return result
    }
    
    
    private func isArray(_ input: Any) -> Bool {
        if let array = input as? [Any] {
            return true
        }
        if let array = input as? [AnyObject] {
            return true
        }
        if let array = input as? NSArray {
            return true
        }
        
        return false
    }
    
}









/* Action */
class Action: Serializable {

    // Serializable component name
    public let componentName = "action"
    
    // Each field as (key, value) pair
    private let type: (String, ActionType)
    private let selector: (String, String)
    
    
    
    // Action with Type only
    init(type: ActionType) {
        self.type = ("type", type)
        self.selector = ("selector", "")
        
        super.init(type: .action,
                   fields: [self.type])
    }
    
    // Action with Type and Selector
    init(type: ActionType, selector: String) {
        self.type = ("type", type)
        self.selector = ("selector", selector)
        
        super.init(type: .action,
                   fields: [self.type, self.selector])
    }
    
}


/* Tests for Action */
print("* Action tests *")

let action1 = Action(type: .block)
let action2 = Action(type: .css_display_none, selector: "#newsletter")
let action3 = Action(type: .block_cookies)

let s_action1 = action1.serialize()
let s_action2 = action2.serialize()
let s_action3 = action3.serialize()

print(s_action1)
print(s_action2)
print(s_action3)









/* Trigger */
class Trigger: Serializable {
    
    // Serializable component name
    let componentName = "trigger"
    
    // Each field as (key, value) pair
    let urlFilter: (String, String)
    var caseSensetive: (String, Bool) = ("url-filter-is-case-sensitive", false)
    var ifDomain: (String, [String]) = ("if-domain", [])
    var unlessDomain: (String, [String]) = ("unless-domain", [])
    var resourceType: (String, [String]) = ("resource-type", [])
    var loadType: (String, [String]) = ("load-type", ["third-party"])
    
    
    
    // Trigger with URL filter
    init(urlFilter: String) {
        self.urlFilter = ("url-filter", urlFilter)
        
        super.init(type: .trigger,
                   fields: [self.urlFilter, self.loadType])
    }

    // Trigger with URL filter and if-domain
    init(urlFilter: String, ifDomain: [String]) {
        self.urlFilter = ("url-filter", urlFilter)
        self.ifDomain = ("if-domain", ifDomain)
        
        super.init(type: .trigger,
                   fields: [self.urlFilter, self.ifDomain, self.loadType])
    }
    
    // Trigger with URL filter and unless-domain
    init(urlFilter: String, unlessDomain: [String]) {
        self.urlFilter = ("url-filter", urlFilter)
        self.unlessDomain = ("unless-domain", unlessDomain)
        
        super.init(type: .trigger,
                   fields: [self.urlFilter, self.unlessDomain, self.loadType])
    }
    
}


/* Tests for Trigger */
print("\n\n")
print("* Trigger tests *")

let trigger1 = Trigger(urlFilter: ".*")
let trigger2 = Trigger(urlFilter: ".*", ifDomain: ["apple.com, bapple.com"])
let trigger3 = Trigger(urlFilter: "^[^:]+://+([^:/]+\\.)?247realmedia\\.com[:/]", unlessDomain: ["capple.com"])

let s_trigger1 = trigger1.serialize()
let s_trigger2 = trigger2.serialize()
let s_trigger3 = trigger3.serialize()

print(s_trigger1)
print(s_trigger2)
print(s_trigger3)









/* Rule */
class Rule {
    
    let trigger: Trigger
    let action: Action
    
    init(trigger: Trigger, action: Action) {
        self.trigger = trigger
        self.action = action
    }
    
    func asString() -> String {
        return "{\(trigger.serialize()), \(action.serialize())}"
    }

}


/* Tests for Rule */
print("\n\n")
print("* Rule tests *")

let rule1 = Rule(trigger: trigger1, action: action3)
let rule2 = Rule(trigger: trigger2, action: action2)
let rule3 = Rule(trigger: trigger3, action: action1)

print(rule1.asString())
print(rule2.asString())
print(rule3.asString())






























/* EasyList parser */

enum RuleToken: String {
    case element_selector = "##"
    case exception = "@@"
    case domain_name_anchor = "||"
    case anchor = "|"
    case option_separator = "$"
}


class Parser {
    
    var rules: [Rule]
    
    init(_ text: String) {
        let begin = text.prefix(2)
        print(begin)
        
        let urlFilter = "*\(text)*"
        let trigger = Trigger(urlFilter: urlFilter)
        
        let action = Action(type: .block)
        
        self.rules = []
    }
    
}


let parser = Parser("&act=ads_")
