# Members
|     Name    | PennKey |
| ----------- | ------- |
| Neil Shweky | nshweky |
|  Jing Wang  | jing17  |

# Project Stucture
```
/
├── Main (the module redirects the main to Server.main)
├── MarkDownParse (the module provides functions that parse input to MarkDown elements)
├── HtmlConvert (the module provides functions that convert Markdown elements to HTML elements)
├── Server (the module runs a online MarkDown parser server)
├── FileParse (the module provides a file to file parse function)
├── Tests (the module contains tests for MarkDownParse)
├── HtmlConvertTest (the module contains tests for HtmlConvert)
├── CMarkTests (the module runs tests from the CommonMark.org)
└── tests.json (the downloaded tests from CommonMark.org)
```
There are other test input/output files, such as test.md, testout.html.

To understand the code, it is suggested to read the code with the order listed above.

# External Dependencies
1. lucid: an HTML package provide the ability to build and output html elements
2. HUnit: test pacakge
3. containers: the data structure package, we used the set structure from it
4. parsec: the parser package
5. aeson: a json manipulation package
6. text: a text type package
7. scotty: web framework package
8. wai-cors: cross-origin support package
