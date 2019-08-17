# AdFree
_App description._


# Contents
1. [Triggers](#Triggers)
1. [Actions](#Actions)
1. [Examples](#Examples)
1. [Documentation](#Documentation)


# Triggers
* url-filter-is-case-sensitive
* if-domain
* unless-domain
* resource-type
    * document 
    * image
    * style-sheet
    * script
    * font
    * raw
    * svg-document
    * media
    * popup
* load-type
    * first-party
    * third-party
* if-top-url
* unless-top-url 
    
`"document", "image", "style-sheet", "script", "font", "raw", "svg-document", "media", "popup"`
`["first-party", "third-party"]`


# Actions 
* Types 
    * block
    * block-cookies
    * css-display-none
    * ignore-previous-rules
    * make-https
* Selector


# Regex 
* Original list 
```&ad_box_
&ad_channel=
&ad_classid=
```
* Replace `^([^$\s]*)` with
```"trigger": {
	"url-filter": "$1",
	"load-type": ["third-party"]
}, "action": {
	"type": "block"
},
```
* Resulting list 
```"trigger": {
    "url-filter": "&ad_box_",
    "load-type": ["third-party"]
}, "action": {
    "type": "block"
},
"trigger": {
    "url-filter": "&ad_channel=",
    "load-type": ["third-party"]
}, "action": {
    "type": "block"
},
"trigger": {
    "url-filter": "&ad_classid=",
    "load-type": ["third-party"]
}, "action": {
    "type": "block"
},
```

# Examples
* Rule syntax 1
```[
    {
        "trigger": {
            "url-filter": ".*",
            "resource-type": ["document", "image", "style-sheet", "script"],
            "unless-domain": ["*apple.com", "trusted-content-server.com"]
        },
        "action": {
            "type": "block"
        }
    }
]
```
* Rule syntax 2 
```[
    {
        "trigger": {
            "url-filter": ".*",
            "resource-type": ["document", "image", "style-sheet", "script", "font",
                "raw", "svg-document", "media", "popup"],
            "if-domain": ["*exoticads.com"]
        },

        "action": {
            "type": "block"
        }
    }
]
```


# Documentation
* [x] [Create a content blocker (Apple)](https://www.google.com/search?client=safari&rls=en&q=create+a+content+blocker+safari&ie=UTF-8&oe=UTF-8)
* [ ] [A content blocker in action (Apple)](https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/ContentBlocker.html)
* [x] [Safari content blocker in Swift](https://www.ios-blog.com/tutorials/swift/create-a-safari-content-blocker/)
