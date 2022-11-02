import 'package:flutter/material.dart';
import 'package:igli_financial/utilities/string.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              margin: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.blue.shade100,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                   Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("${CS.needHelp}?",style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    child: Text("Fill up the form below to reach out to us, or \nconnect with us at"),
                  ),
                  TextButton(onPressed: () {

                  }, child: Row(
                    children:  [
                      const Icon(Icons.email,color: Colors .blue,),
                      Text(CS.dEmail,style: const TextStyle(color: Colors.blue),),
                    ],
                  )),
                   Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(CS.weWillBeHappyToAssistYou),
                  ),
                ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
             Text("${CS.selectEntity}*"),
            const TextField(),
            const SizedBox(height: 30,),
             Text(CS.whatIsTheQueryAbout),
            const TextField(),
            const SizedBox(height: 20,),

             TextField(
              maxLines: 10,
              decoration: InputDecoration(hintText: CS.typeYourMessageHere,border: const OutlineInputBorder(),hintStyle: const TextStyle(color: Colors.grey)),

            ),
            InkWell(
              onTap: (){},
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(top:  50),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(25)),
                child:  Text(CS.save,style: const TextStyle(fontSize: 16),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
