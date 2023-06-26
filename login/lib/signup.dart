import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'Homescreen.dart';
import 'login.dart';
class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    GlobalKey<FormState> formKey =GlobalKey<FormState>();
     TextEditingController nameCtrl = TextEditingController();
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController passCtrl = TextEditingController();
    TextEditingController confpassCtrl = TextEditingController();
    return Scaffold(
  
      body:Container(
         height: size.height,
         width:size.width,
         padding: const EdgeInsets.only(top:60, left: 20,right:20),
         color: Color.fromARGB(255, 146, 172, 180),
        child:Form(
         key:formKey,
         child: Column(
          children:[
            Text("Register", style: TextStyle(color: Color.fromARGB(255, 65, 62, 62), fontSize: 30, letterSpacing:10 ),),
             Padding(padding: EdgeInsets.all(15),child: Text("Create your account")),
            TextFormField(
              controller: nameCtrl,
             validator: RequiredValidator(errorText: "Required*"),
              decoration: const InputDecoration(
                
                border: OutlineInputBorder(),
                
                prefixIcon: Icon(Icons.person),
                hintText:"John Smith", labelText:'username',
              ),
              
            ),
            SizedBox(height:16),
            TextFormField(
              controller: emailCtrl,
            validator: MultiValidator([
                  RequiredValidator(errorText: 'Required*'),
                  EmailValidator(errorText: "Enter a valid email*")
                ]),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                
                prefixIcon: Icon(Icons.email),
                hintText:"JohnSmith@GMIL.COM", labelText:'EMAIL'
              ),
            ),
            SizedBox(height:16),
             TextFormField(
              controller: passCtrl,
               obscureText: true,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Required*'),
                 LengthRangeValidator(
                    min: 8,
                    max: 10,
                    errorText: "Password length should be 8-10"),
                ]),
              decoration: const InputDecoration(
                 border: OutlineInputBorder(),
                 
                prefixIcon: Icon(Icons.password),
                hintText:"xxxxxx",labelText: 'Password',
              ),
            ),
            SizedBox(height:16),
             TextFormField(
              controller: confpassCtrl,
               obscureText: true,
               
              validator: (val){
                if(val!=passCtrl.text){
                  return("password don't match");
                }
                else{
                  return null;
                }
              },
              decoration: const InputDecoration(
                 border: OutlineInputBorder(),
                 
                prefixIcon: Icon(Icons.password),
                hintText:"xxxxxx",labelText: 'Password',
              ),
            ),
            SizedBox(height:26),
            SizedBox(
                height: 52,
                width: size.width,
                child: ElevatedButton(
              
                    onPressed: () {
                      
                      if (formKey.currentState!.validate() == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => login(
                                    )));
                      }
                    },
                     style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
              ),
               SizedBox(
                height: 52,
                width: size.width,
                
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
              
              new GestureDetector(
  onTap: () {
    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => login(
                                    )));
  },
  child: new Text("  Login", style: TextStyle(color: Colors.blue),),
),
  ],
              ),
          ],
         ),
        ),
      ),
    );
  }
}