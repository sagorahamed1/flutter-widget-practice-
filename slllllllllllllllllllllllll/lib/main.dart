import 'dart:convert';

void main (){
 var s = {
    "data": [{"name": "sagor", "phone" : "ten"}]
 };

 print(s.runtimeType);

 var ss = jsonDecode(s);

}