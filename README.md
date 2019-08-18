# AdFree
_App description._


# Contents
1. [Partitions](#partitions)
1. [Triggers](#triggers)
1. [Actions](#actions)
1. [Examples](#examples)
1. [Documentation](#documentation)


# Partitions
1. Lines 17-1017
2. Lines 1018-2017
3. Lines 2018-3017
4. Lines 3018-4017
5. Lines 4018-5017
6. Lines 5018-6017


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
```
&ad_box_
&ad_channel=
&ad_classid=
```
* Replace `^([^$\s]*)` with
```json
"trigger": {
	"url-filter": "$1",
	"load-type": ["third-party"]
}, "action": {
	"type": "block"
},
```
* Resulting list 
```json
"trigger": {
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
```json
[
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
```json
[
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
* [x] [Create a content blocker (Apple)](https://developer.apple.com/documentation/safariservices/creating_a_content_blocker)
* [x] [A content blocker in action (Apple)](https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/ContentBlocker.html)
* [x] [Safari content blocker in Swift](https://www.ios-blog.com/tutorials/swift/create-a-safari-content-blocker/)
