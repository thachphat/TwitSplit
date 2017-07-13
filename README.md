# TwitSplit

##Screens
- [ ] Login Twitter
- [ ] Messages

##Features
- [ ] Login twitter
- [ ] Post message
- [ ] View old messages
- [ ] Split message if needed
- [ ] Test split message

##Split message logic:
- [ ] If a user's input is less than or equal to 50 characters, post it as is.
- [ ] If a user's input is greater than 50 characters, split it into chunks that each is less than or equal to 50 characters and post each chunk as a separate message.
- [ ] Messages will only be split on whitespace. If the message contains a span of non-whitespace characters longer than 50 characters, display an error. 
- [ ] Split messages will have a "part indicator" appended to the beginning of each section. In the example above, the message was split into two chunks, so the part indicators read "1/2" and "2/2". Be aware that these count toward the character limit.

##License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details