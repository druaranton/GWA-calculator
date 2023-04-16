# Exercise 03: Flutter Forms
A GWA calculator app ceated using Flutter/Dart.

### Andreau O. Aranton
### 2020-00947
### D-1L

## Screenshots
![image](https://i.postimg.cc/Pq9kWYrw/Screenshot-2022-10-06-234628.png)
![image](https://i.postimg.cc/gjqFb7yV/Screenshot-2022-10-07-152706.png)
![image](https://i.postimg.cc/zDn1hLmy/Screenshot-2022-10-07-152841.png)
![image](https://i.postimg.cc/9FCHYWVJ/Screenshot-2022-10-07-152930.png)

## Things you did in the code
I implemented OOP in a way that I tried making the attributes/members as strict as possible. What I did is I first think of a way on how I could layout the widgets dynamically. I thought of creating an input block where the three widgets (for the subject, grade and units) are there and them I would make them reusable. Then, I made the buttons for the adding subjects and computing of GWA. I retrieved the values of the input blocks and them used it to compute for the GWA and then display it to the screen.

## Challenges faced
One of the challenges I faced is that I didn't know how to retrieve the values from my Input block. What I did is that I searched up a bit and found out that I can declare attributes at the class and then access it in the state class using the widget keywork (ex. widget.varname = value;). Another challenge that I faced is that I sometimes get confused with the nesting of the widgets in dart/flutter. What I did is I examined my code carefully to know where did I go wrong and then there I solved it.

## Test Cases
Happy paths: When I sucessfully retrieved the values from my input blocks.
Unhappy paths: When I didn't know why my dropdown didn't reset after clicking the reset button.

## References
https://googleflutter.com/flutter-text-bold/#:~:text=To%20display%20bold%20text%20in,property%20for%20the%20Text%20widget.
https://www.tutorialkart.com/flutter/flutter-change-font-size-of-text-widget/#:~:text=You%20can%20change%20the%20font,as%20style%20for%20Text%20Widget.
https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter
https://letmeflutter.com/how-to-change-flutter-textformfield-background-color/
